// Azure Data Factory Module
// Creates ADF with pipeline for Salesforce data extraction

@description('Data Factory name')
param dataFactoryName string

@description('Location for resources')
param location string

@description('Storage Account name')
param storageAccountName string

@description('Storage Account resource ID')
param storageAccountId string

@description('Key Vault URI')
param keyVaultUri string

@description('Salesforce source object API name')
param salesforceSourceObject string

@description('Salesforce destination object API name for AI insights')
param salesforceDestinationObject string

@description('Salesforce API version')
param salesforceApiVersion string = '60.0'

@description('Custom SOQL query (optional)')
param salesforceQuery string = ''

// Storage Blob Data Contributor role ID for Data Factory
var storageBlobDataContributorRoleId = 'ba92f5b4-2d11-453d-a403-e96b0029c9fe'

// Data Factory
resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

// Reference existing storage account
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: storageAccountName
}

// Role Assignment: Storage Blob Data Contributor for Data Factory
resource adfStorageRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(storageAccountId, dataFactory.id, storageBlobDataContributorRoleId)
  scope: storageAccount
  properties: {
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      storageBlobDataContributorRoleId
    )
    principalId: dataFactory.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// Linked Service: Azure Blob Storage (using Managed Identity)
resource blobLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  parent: dataFactory
  name: 'AzureBlobStorage'
  properties: {
    type: 'AzureBlobStorage'
    typeProperties: {
      serviceEndpoint: 'https://${storageAccountName}.blob.${environment().suffixes.storage}'
      accountKind: 'StorageV2'
      credential: {
        referenceName: 'ManagedIdentityCredential'
        type: 'CredentialReference'
      }
    }
    annotations: []
  }
  dependsOn: [
    adfStorageRoleAssignment
    managedIdentityCredential
  ]
}

// Managed Identity Credential for Data Factory
resource managedIdentityCredential 'Microsoft.DataFactory/factories/credentials@2018-06-01' = {
  parent: dataFactory
  name: 'ManagedIdentityCredential'
  properties: {
    type: 'ManagedIdentity'
    typeProperties: {}
  }
}

// Linked Service: Azure Key Vault (for Salesforce credentials)
resource keyVaultLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  parent: dataFactory
  name: 'AzureKeyVault'
  properties: {
    type: 'AzureKeyVault'
    typeProperties: {
      baseUrl: keyVaultUri
    }
  }
}

// Linked Service: Salesforce (V2 connector)
resource salesforceLinkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = {
  parent: dataFactory
  name: 'Salesforce'
  properties: {
    type: 'SalesforceV2'
    typeProperties: {
      environmentUrl: {
        type: 'AzureKeyVaultSecret'
        store: {
          referenceName: 'AzureKeyVault'
          type: 'LinkedServiceReference'
        }
        secretName: 'SalesforceInstanceUrl'
      }
      authenticationType: 'OAuth2ClientCredentials'
      clientId: {
        type: 'AzureKeyVaultSecret'
        store: {
          referenceName: 'AzureKeyVault'
          type: 'LinkedServiceReference'
        }
        secretName: 'SalesforceClientId'
      }
      clientSecret: {
        type: 'AzureKeyVaultSecret'
        store: {
          referenceName: 'AzureKeyVault'
          type: 'LinkedServiceReference'
        }
        secretName: 'SalesforceClientSecret'
      }
      apiVersion: salesforceApiVersion
    }
  }
  dependsOn: [
    keyVaultLinkedService
  ]
}

// Dataset: Salesforce Source (Call Reports) - V2
resource salesforceDataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: 'SalesforceCallReports'
  properties: {
    linkedServiceName: {
      referenceName: 'Salesforce'
      type: 'LinkedServiceReference'
    }
    type: 'SalesforceV2Object'
    typeProperties: {
      objectApiName: salesforceSourceObject
    }
  }
  dependsOn: [
    salesforceLinkedService
  ]
}

// Dataset: Blob Storage Sink
resource blobDataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: 'BlobDataset'
  properties: {
    linkedServiceName: {
      referenceName: 'AzureBlobStorage'
      type: 'LinkedServiceReference'
    }
    type: 'Json'
    typeProperties: {
      location: {
        type: 'AzureBlobStorageLocation'
        container: 'datasets'
        fileName: {
          value: '@concat(\'callreports_\', formatDateTime(utcnow(), \'yyyyMMdd_HHmmss\'), \'.json\')'
          type: 'Expression'
        }
      }
    }
  }
  dependsOn: [
    blobLinkedService
  ]
}

// Pipeline: Salesforce to Blob
resource extractPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  parent: dataFactory
  name: 'SalesforceCallReportPipeline'
  properties: {
    activities: [
      {
        name: 'CopyCallReportsToBlob'
        type: 'Copy'
        typeProperties: {
          source: {
            type: 'SalesforceV2Source'
            SOQLQuery: {
              value: '@concat(\'SELECT Id, Name, calldetails__c, callhighlights__c, Description__c, Status__c, CreatedDate FROM \', pipeline().parameters.sourceObject, \' WHERE CreatedDate >= \', pipeline().parameters.startDate)'
              type: 'Expression'
            }
          }
          sink: {
            type: 'JsonSink'
            storeSettings: {
              type: 'AzureBlobStorageWriteSettings'
            }
            formatSettings: {
              type: 'JsonWriteSettings'
              filePattern: 'arrayOfObjects'
            }
          }
        }
        inputs: [
          {
            referenceName: 'SalesforceCallReports'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'BlobDataset'
            type: 'DatasetReference'
          }
        ]
      }
    ]
    parameters: {
      sourceObject: {
        type: 'String'
        defaultValue: salesforceSourceObject
      }
      startDate: {
        type: 'String'
        defaultValue: 'LAST_N_DAYS:30'
      }
    }
  }
  dependsOn: [
    salesforceDataset
    blobDataset
  ]
}

// Trigger: Daily extraction
resource dailyTrigger 'Microsoft.DataFactory/factories/triggers@2018-06-01' = {
  parent: dataFactory
  name: 'DailyExtractionTrigger'
  properties: {
    type: 'ScheduleTrigger'
    typeProperties: {
      recurrence: {
        frequency: 'Day'
        interval: 1
        startTime: '2024-01-01T02:00:00Z'
        timeZone: 'UTC'
      }
    }
    pipelines: [
      {
        pipelineReference: {
          referenceName: 'SalesforceCallReportPipeline'
          type: 'PipelineReference'
        }
        parameters: {
          sourceObject: salesforceSourceObject
          startDate: 'YESTERDAY'
        }
      }
    ]
  }
  dependsOn: [
    extractPipeline
  ]
}

// ============================================
// WRITE-BACK PIPELINE: Blob to Salesforce
// ============================================

// Dataset: Salesforce Destination (AI Insights) - V2
resource salesforceDestinationDataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: 'SalesforceAIInsights'
  properties: {
    linkedServiceName: {
      referenceName: 'Salesforce'
      type: 'LinkedServiceReference'
    }
    type: 'SalesforceV2Object'
    typeProperties: {
      objectApiName: salesforceDestinationObject
    }
  }
  dependsOn: [
    salesforceLinkedService
  ]
}

// Dataset: Blob Storage Source (Processed Insights)
resource processedBlobDataset 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  parent: dataFactory
  name: 'ProcessedInsightsBlob'
  properties: {
    linkedServiceName: {
      referenceName: 'AzureBlobStorage'
      type: 'LinkedServiceReference'
    }
    type: 'Json'
    typeProperties: {
      location: {
        type: 'AzureBlobStorageLocation'
        container: 'output'
        fileName: {
          value: '@pipeline().parameters.fileName'
          type: 'Expression'
        }
      }
    }
  }
  dependsOn: [
    blobLinkedService
  ]
}

// Pipeline: Blob to Salesforce (Write-Back)
resource writeBackPipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  parent: dataFactory
  name: 'SalesforceWriteBackPipeline'
  properties: {
    activities: [
      {
        name: 'CopyInsightsToSalesforce'
        type: 'Copy'
        typeProperties: {
          source: {
            type: 'JsonSource'
            storeSettings: {
              type: 'AzureBlobStorageReadSettings'
              recursive: false
            }
            formatSettings: {
              type: 'JsonReadSettings'
            }
          }
          sink: {
            type: 'SalesforceV2Sink'
            writeBehavior: 'insert'
            writeBatchSize: 5000
            ignoreNullValues: false
          }
          enableStaging: false
          translator: {
            type: 'TabularTranslator'
            typeConversion: true
            typeConversionSettings: {
              allowDataTruncation: true
              treatBooleanAsNumber: false
            }
          }
        }
        inputs: [
          {
            referenceName: 'ProcessedInsightsBlob'
            type: 'DatasetReference'
          }
        ]
        outputs: [
          {
            referenceName: 'SalesforceAIInsights'
            type: 'DatasetReference'
          }
        ]
      }
    ]
    parameters: {
      fileName: {
        type: 'String'
        defaultValue: ''
      }
      destinationObject: {
        type: 'String'
        defaultValue: salesforceDestinationObject
      }
    }
  }
  dependsOn: [
    processedBlobDataset
    salesforceDestinationDataset
  ]
}

// NOTE: Data Factory triggers are created in "Stopped" state by default
// The trigger can be started via:
// 1. Azure Portal: Data Factory -> Author & Monitor -> Manage -> Triggers -> Start
// 2. Azure CLI: az datafactory trigger start --resource-group <rg> --factory-name <adf-name> --name DailyExtractionTrigger
// 3. The trigger will auto-activate on first manual pipeline run

// Outputs
output dataFactoryName string = dataFactory.name
output dataFactoryId string = dataFactory.id
output dataFactoryPrincipalId string = dataFactory.identity.principalId
output pipelineName string = extractPipeline.name
output writeBackPipelineName string = writeBackPipeline.name
