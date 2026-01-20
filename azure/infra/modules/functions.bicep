// Azure Functions Module
// Deploys Function App with all InsightFlow functions

@description('Function App name')
param functionAppName string

@description('Hosting Plan name')
param hostingPlanName string

@description('Location for resources')
param location string

@description('Storage Account name')
param storageAccountName string

@description('Storage Account resource ID')
param storageAccountId string

@description('Key Vault URI')
param keyVaultUri string

@description('Application Insights Connection String')
param appInsightsConnectionString string

@description('AI Model to use')
param aiModel string

@description('Batch processing size')
param batchSize int

@description('Function App SKU')
@allowed(['Y1', 'EP1', 'EP2', 'EP3', 'B1', 'S1'])
param skuName string

@description('Data Factory name for pipeline triggers')
param dataFactoryName string

@description('Azure AI Project Endpoint')
param aiProjectEndpoint string

@description('Azure OpenAI Deployment Name')
param aiDeploymentName string

@description('URL for functions package with SAS token (WEBSITE_RUN_FROM_PACKAGE)')
@metadata({
  example: 'https://yourstorageaccount.blob.core.windows.net/releases/v1.0.0/functions.zip?sp=r&st=2024-01-01T00:00:00Z&se=2026-12-31T23:59:59Z&spr=https&sv=2022-11-02&sr=b&sig=...'
  note: 'Must be Azure Blob Storage URL with SAS token for Marketplace compliance'
})
param functionsPackageUrl string

@description('Salesforce destination object API name for AI insights write-back')
param salesforceDestinationObject string

@description('Subscription ID for Data Factory API calls')
param subscriptionId string = subscription().subscriptionId

@description('Resource Group name')
param resourceGroupName string = resourceGroup().name

@description('Virtual Network ID for VNet Integration')
param vnetId string

@description('Subnet ID for VNet Integration')
param vnetIntegrationSubnetId string

@description('Enable VNet Integration and restrict public access (default: true)')
param enableVnetIntegration bool = true

// Reference existing storage account (must be declared before using listKeys)
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: storageAccountName
}

// Variables
var isConsumptionPlan = skuName == 'Y1'
var isElasticPlan = startsWith(skuName, 'EP')
var skuTier = isConsumptionPlan ? 'Dynamic' : (isElasticPlan ? 'ElasticPremium' : (skuName == 'B1' ? 'Basic' : 'Standard'))

// Storage Blob Data Contributor role ID
var storageBlobDataContributorRoleId = 'ba92f5b4-2d11-453d-a403-e96b0029c9fe'

// Get storage account key for Function App content (required for App Service plans)
var storageAccountKey = storageAccount.listKeys().keys[0].value
var storageConnectionString = 'DefaultEndpointsProtocol=https;AccountName=${storageAccountName};AccountKey=${storageAccountKey};EndpointSuffix=${environment().suffixes.storage}'

// Hosting Plan
resource hostingPlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: hostingPlanName
  location: location
  sku: {
    name: skuName
    tier: skuTier
  }
  properties: {
    reserved: false // Windows
    maximumElasticWorkerCount: isElasticPlan ? 20 : (isConsumptionPlan ? 1 : 0)
  }
}

// Function App
resource functionApp 'Microsoft.Web/sites@2023-01-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: hostingPlan.id
    httpsOnly: true
    publicNetworkAccess: enableVnetIntegration ? 'Disabled' : 'Enabled'
    vnetRouteAllEnabled: enableVnetIntegration
    siteConfig: {
      vnetRouteAllEnabled: enableVnetIntegration
      nodeVersion: '~20'
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      cors: {
        allowedOrigins: [
          'https://*.salesforce.com'
          'https://*.force.com'
          'https://*.my.salesforce.com'
        ]
        supportCredentials: true
      }
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
          value: storageConnectionString
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: storageConnectionString
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: toLower(functionAppName)
        }
        {
          name: 'AZURE_STORAGE_ACCOUNT_NAME'
          value: storageAccountName
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: functionsPackageUrl
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'node'
        }
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION'
          value: '~20'
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsightsConnectionString
        }
        // Key Vault References
        {
          name: 'SF_INSTANCE_URL'
          value: '@Microsoft.KeyVault(VaultName=${split(split(keyVaultUri, '/')[2], '.')[0]};SecretName=SalesforceInstanceUrl)'
        }
        {
          name: 'SF_CLIENT_ID'
          value: '@Microsoft.KeyVault(VaultName=${split(split(keyVaultUri, '/')[2], '.')[0]};SecretName=SalesforceClientId)'
        }
        {
          name: 'SF_CLIENT_SECRET'
          value: '@Microsoft.KeyVault(VaultName=${split(split(keyVaultUri, '/')[2], '.')[0]};SecretName=SalesforceClientSecret)'
        }
        // AI Configuration
        {
          name: 'AI_MODEL'
          value: aiModel
        }
        {
          name: 'AZURE_AI_PROJECT_ENDPOINT'
          value: aiProjectEndpoint
        }
        {
          name: 'AZURE_OPENAI_DEPLOYMENT_NAME'
          value: aiDeploymentName
        }
        {
          name: 'BATCH_SIZE'
          value: string(batchSize)
        }
        // Storage containers
        {
          name: 'INPUT_CONTAINER'
          value: 'datasets'
        }
        {
          name: 'OUTPUT_CONTAINER'
          value: 'output'
        }
        {
          name: 'SUMMARIES_CONTAINER'
          value: 'summaries'
        }
        {
          name: 'SYNC_STATUS_CONTAINER'
          value: 'sf-sync-status'
        }
        // Salesforce configuration
        {
          name: 'SF_DESTINATION_OBJECT'
          value: salesforceDestinationObject
        }
        // Data Factory configuration for pipeline triggers
        {
          name: 'AZURE_SUBSCRIPTION_ID'
          value: subscriptionId
        }
        {
          name: 'AZURE_RESOURCE_GROUP'
          value: resourceGroupName
        }
        {
          name: 'DATA_FACTORY_NAME'
          value: dataFactoryName
        }
        {
          name: 'PIPELINE_NAME'
          value: 'SalesforceCallReportPipeline'
        }
      ]
      functionAppScaleLimit: isConsumptionPlan ? 200 : (isElasticPlan ? 20 : 0)
    }
  }
}

// Function App Config - Host settings
resource functionAppConfig 'Microsoft.Web/sites/config@2023-01-01' = {
  parent: functionApp
  name: 'web'
  properties: {
    functionAppScaleLimit: isConsumptionPlan ? 200 : (isElasticPlan ? 20 : 0)
    use32BitWorkerProcess: false
    netFrameworkVersion: 'v6.0'
  }
}

// Role Assignment: Storage Blob Data Contributor for Function App
resource storageBlobRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(storageAccountId, functionApp.id, storageBlobDataContributorRoleId)
  scope: storageAccount
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', storageBlobDataContributorRoleId)
    principalId: functionApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// Role Assignment: Key Vault Secrets User for Function App
// This is done HERE (not in main.bicep) to prevent race condition where
// Function App starts before it has permission to read Key Vault secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: split(split(keyVaultUri, '/')[2], '.')[0] // Extract vault name from URI like https://vaultname.vault.azure.net/
}

resource keyVaultSecretsUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, functionApp.id, 'Key Vault Secrets User')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6') // Key Vault Secrets User
    principalId: functionApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// VNet Integration for Function App
resource functionAppVnetIntegration 'Microsoft.Web/sites/networkConfig@2023-01-01' = if (enableVnetIntegration) {
  parent: functionApp
  name: 'virtualNetwork'
  properties: {
    subnetResourceId: vnetIntegrationSubnetId
    swiftSupported: true
  }
}

// Outputs
output functionAppName string = functionApp.name
output functionAppId string = functionApp.id
output functionAppUrl string = functionApp.properties.defaultHostName
output functionAppPrincipalId string = functionApp.identity.principalId
