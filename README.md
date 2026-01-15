# InsightFlow Bicep Templates

This repository hosts the Azure Resource Manager (ARM) templates for InsightFlow deployment. These templates are referenced by the Azure Marketplace managed application.

## Repository Structure

```
azure/infra/
├── mainTemplate.json           # Main ARM template
├── createUiDefinition.json     # Marketplace UI definition
└── modules/                    # ARM template modules
    ├── ai-foundry.json
    ├── appinsights.json
    ├── datafactory.json
    ├── functions.json
    ├── keyvault-access.json
    ├── keyvault.json
    └── storage.json
```

## Versioning

This repository uses git tags for version control:
- `v1.0.0` - Initial stable release
- `main` - Latest development version

## Usage

Templates are accessed via GitHub raw URLs:
```
https://raw.githubusercontent.com/YOUR_USERNAME/insightflow-bicep-templates/v1.0.0/azure/infra/mainTemplate.json
```

## Azure Resources Deployed

- Azure Functions (Python 3.11)
- Azure Storage Account
- Azure Key Vault
- Azure Data Factory with Salesforce connector
- Azure OpenAI Service
- Application Insights
- Azure AI Foundry project

## License

Proprietary - All rights reserved
