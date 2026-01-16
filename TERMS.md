# Terms and Conditions - InsightFlow

**Effective Date:** January 16, 2026
**Version:** 1.0.0

## 1. Acceptance of Terms

By deploying InsightFlow through Azure Marketplace, you ("Customer") agree to be bound by these Terms and Conditions. If you do not agree to these terms, do not deploy or use InsightFlow.

## 2. Service Description

InsightFlow is an Azure solution template that deploys infrastructure for AI-powered analysis of Salesforce call reports using Azure OpenAI services.

## 3. License Grant

Subject to compliance with these Terms, we grant you a non-exclusive, non-transferable, revocable license to:
- Deploy InsightFlow infrastructure in your Azure subscription
- Use the deployed services for your internal business purposes
- Integrate with your Salesforce instance

## 4. Customer Responsibilities

You are responsible for:
- All Azure infrastructure costs incurred by your deployment
- Maintaining valid Salesforce credentials and API access
- Compliance with Salesforce terms of service
- Data security and privacy in your Azure environment
- Compliance with applicable laws and regulations
- Proper configuration and usage of Azure OpenAI services

## 5. Azure Costs

InsightFlow deploys Azure resources that incur charges based on:
- Azure Functions usage (compute time)
- Azure OpenAI API calls and tokens
- Azure Storage transactions and data storage
- Azure Data Factory pipeline runs
- Data egress charges

You are solely responsible for all Azure costs. Pricing varies by tier selected and usage patterns.

## 6. Data Privacy and Security

### 6.1 Data Processing
- InsightFlow processes Salesforce data within your Azure subscription
- All data remains in your Azure tenant
- We do not access, store, or process your data
- You maintain full control and ownership of all data

### 6.2 Salesforce Integration
- Your Salesforce credentials are stored securely in Azure Key Vault
- API calls to Salesforce are made from your Azure Functions
- You must ensure compliance with Salesforce data policies

### 6.3 Azure OpenAI
- Call report content is sent to Azure OpenAI for analysis
- OpenAI data processing terms apply
- You must comply with Azure OpenAI acceptable use policies

## 7. Third-Party Services

InsightFlow integrates with:
- **Salesforce**: Subject to Salesforce terms of service
- **Azure OpenAI**: Subject to Azure OpenAI terms and acceptable use policies
- **Microsoft Azure**: Subject to Azure terms of service

You are responsible for compliance with all third-party service terms.

## 8. Intellectual Property

### 8.1 Our Rights
We retain all rights to:
- InsightFlow name and branding
- ARM/Bicep template code
- Infrastructure architecture and design

### 8.2 Your Rights
You retain all rights to:
- Your Salesforce data
- AI-generated insights and analysis
- Custom configurations and modifications

## 9. Warranties and Disclaimers

### 9.1 Disclaimer of Warranties
INSIGHTFLOW IS PROVIDED "AS IS" WITHOUT WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO:
- MERCHANTABILITY
- FITNESS FOR A PARTICULAR PURPOSE
- NON-INFRINGEMENT
- ACCURACY OF AI ANALYSIS
- UNINTERRUPTED OR ERROR-FREE OPERATION

### 9.2 Azure Services
InsightFlow relies on Azure services. Service availability and performance depend on Azure infrastructure.

## 10. Limitation of Liability

TO THE MAXIMUM EXTENT PERMITTED BY LAW:
- WE SHALL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES
- OUR TOTAL LIABILITY SHALL NOT EXCEED THE AMOUNT YOU PAID FOR INSIGHTFLOW IN THE PAST 12 MONTHS
- WE ARE NOT LIABLE FOR AZURE INFRASTRUCTURE COSTS OR THIRD-PARTY SERVICE CHARGES

## 11. Support and Maintenance

### 11.1 Template Updates
- Infrastructure templates are hosted on GitHub
- Updates are provided at our discretion
- You can choose which version to deploy

### 11.2 Support
- Community support via GitHub issues
- No guaranteed response time for free tier
- Paid support plans may be available separately

## 12. Termination

### 12.1 By Customer
You may terminate at any time by:
- Deleting the Azure resource group
- Removing all deployed InsightFlow resources

### 12.2 By Us
We may terminate access if you:
- Violate these Terms
- Use InsightFlow for illegal purposes
- Engage in abusive or fraudulent behavior

### 12.3 Effect of Termination
- Your license to use InsightFlow terminates
- Azure resources remain in your subscription until you delete them
- You remain responsible for Azure costs until resources are deleted

## 13. Updates to Terms

We may update these Terms at any time by:
- Publishing new version on GitHub
- Updating the version number and effective date
- Continued use after updates constitutes acceptance

## 14. Compliance and Legal

### 14.1 Export Control
You must comply with all applicable export control laws and regulations.

### 14.2 Data Protection
If processing personal data, you must comply with:
- GDPR (if applicable)
- CCPA (if applicable)
- Other applicable data protection laws

### 14.3 AI Regulations
You must comply with applicable AI regulations and use Azure OpenAI responsibly.

## 15. Indemnification

You agree to indemnify and hold us harmless from claims arising from:
- Your use of InsightFlow
- Your violation of these Terms
- Your violation of third-party rights
- Your data processing activities

## 16. Governing Law

These Terms are governed by:
- **Jurisdiction:** State of Delaware, United States
- **Venue:** Courts of Delaware
- **Language:** English

## 17. Entire Agreement

These Terms constitute the entire agreement between you and us regarding InsightFlow, superseding any prior agreements.

## 18. Severability

If any provision is found unenforceable, the remaining provisions remain in full effect.

## 19. No Waiver

Failure to enforce any provision does not waive our right to enforce it later.

## 20. Contact Information

For questions about these Terms:
- **GitHub Issues:** https://github.com/exon-sohan/insightflow-bicep-templates/issues
- **Email:** [Your support email]

## 21. Acknowledgment

By deploying InsightFlow, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.

---

**Last Updated:** January 16, 2026
**Version:** 1.0.0
