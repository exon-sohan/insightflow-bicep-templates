# InsightFlow - Legal Terms

**Effective Date:** January 16, 2026
**Version:** 1.0.0

---

# Table of Contents

1. [Terms and Conditions](#terms-and-conditions)
2. [Privacy Policy](#privacy-policy)

---

# Terms and Conditions

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

## 21. Acknowledgment

By deploying InsightFlow, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.

---

# Privacy Policy

## 1. Introduction

This Privacy Policy explains how InsightFlow handles data when you deploy and use our Azure solution template.

## 2. Data Controller

**You are the data controller.** InsightFlow is a solution template that deploys infrastructure in YOUR Azure subscription. You maintain full control and ownership of all data.

## 3. What Data We Do NOT Collect

**We do not collect, access, store, or process:**
- Your Salesforce data
- Your call reports or analysis results
- Your Salesforce credentials
- Your Azure configuration
- Any customer personal information
- Any usage analytics or telemetry

## 4. What Data Stays in Your Environment

All data remains within your Azure subscription:

### 4.1 Salesforce Data
- **Storage:** Your Azure Storage Account
- **Processing:** Your Azure Functions
- **Control:** You maintain full access and deletion rights

### 4.2 Credentials
- **Storage:** Your Azure Key Vault
- **Encryption:** Managed by Azure Key Vault
- **Access:** Only your deployed resources can access

### 4.3 AI Analysis Results
- **Storage:** Your Azure Storage Account and Salesforce
- **Processing:** Azure OpenAI (subject to Microsoft's privacy policy)
- **Retention:** You control retention policies

### 4.4 Logs and Monitoring
- **Application Insights:** Stored in your Azure subscription
- **Function logs:** Stored in your Azure Storage Account
- **Control:** You configure retention periods

## 5. Third-Party Data Processing

### 5.1 Microsoft Azure
InsightFlow uses Azure services that process data according to:
- **Microsoft Privacy Statement:** https://privacy.microsoft.com/privacystatement
- **Azure Trust Center:** https://azure.microsoft.com/trust-center/

### 5.2 Azure OpenAI
Call report content is sent to Azure OpenAI for analysis:
- **Data Processing:** Subject to Azure OpenAI terms
- **Data Residency:** Based on your Azure region selection
- **Data Retention:** Microsoft does not retain data for model training (as per Azure OpenAI commitments)
- **Learn more:** https://learn.microsoft.com/azure/ai-services/openai/

### 5.3 Salesforce
InsightFlow connects to your Salesforce instance:
- **Salesforce Privacy:** https://www.salesforce.com/privacy/
- **API Calls:** Made from your Azure Functions
- **Data Flow:** Salesforce → Azure → Analysis → Salesforce

## 6. Data Flows

### 6.1 Ingestion Flow
```
Salesforce (Your instance)
    ↓ (Azure Data Factory pulls data)
Azure Storage Account (Your subscription)
    ↓ (Azure Functions reads)
Azure Functions (Your app)
    ↓ (API calls)
Azure OpenAI (Microsoft managed)
    ↓ (Returns insights)
Azure Functions (Your app)
    ↓ (Stores results)
Azure Storage + Salesforce (Your data)
```

### 6.2 Data Residency
- Data is processed in the Azure region you select during deployment
- Azure OpenAI may process in different region based on model availability
- You can choose regions to comply with data residency requirements

## 7. Data Security

### 7.1 Encryption
- **At Rest:** Azure Storage encryption (AES-256)
- **In Transit:** HTTPS/TLS 1.2+ for all connections
- **Credentials:** Azure Key Vault encryption

### 7.2 Access Control
- **Azure RBAC:** Control who can access resources
- **Managed Identity:** Secure service-to-service authentication
- **Key Vault:** Centralized secret management

### 7.3 Network Security
- **HTTPS Only:** All endpoints require HTTPS
- **CORS:** Configured for Salesforce domains only
- **Private Endpoints:** Optional (configure manually)

## 8. Data Retention

You control all retention policies:
- **Storage Account:** Configure lifecycle management policies
- **Application Insights:** Configure retention (default 90 days)
- **Function Logs:** Configure retention
- **Salesforce:** Managed by your Salesforce policies

## 9. Data Deletion

To delete all data:
1. Delete the Azure resource group
2. Remove synchronized data from Salesforce (if desired)
3. All Azure data is permanently deleted

**Note:** Azure may retain backups for up to 90 days for disaster recovery.

## 10. Your Rights (GDPR/CCPA)

If you process personal data of EU residents or California residents:

### 10.1 Data Subject Rights
You are responsible for honoring:
- Right to access
- Right to rectification
- Right to erasure
- Right to restrict processing
- Right to data portability
- Right to object

### 10.2 Our Role
We provide the infrastructure template only. You are the data controller and responsible for:
- Responding to data subject requests
- Maintaining lawful basis for processing
- Conducting Data Protection Impact Assessments (if required)

## 11. Cookies and Tracking

InsightFlow does NOT use:
- Cookies
- Web beacons
- Tracking pixels
- Analytics on our side

Azure Portal and Salesforce may use their own tracking mechanisms.

## 12. Children's Privacy

InsightFlow is not intended for children under 13. We do not knowingly collect data from children.

## 13. International Data Transfers

If you deploy in non-EU regions while processing EU resident data:
- Ensure compliance with GDPR transfer requirements
- Microsoft provides Standard Contractual Clauses (SCCs)
- Review Azure compliance documentation

## 14. Data Breach Notification

In case of Azure infrastructure breach:
- **Microsoft's Responsibility:** Notify you of Azure-level breaches
- **Your Responsibility:** Notify affected individuals and authorities
- **Timeframe:** Follow applicable laws (e.g., 72 hours for GDPR)

## 15. GitHub Repository

Our ARM templates are hosted publicly on GitHub:
- **Repository:** https://github.com/exon-sohan/insightflow-bicep-templates
- **Content:** Infrastructure code only, no customer data
- **Privacy:** GitHub's privacy policy applies to repository access logs

## 16. Updates to Privacy Policy

We may update this policy by:
- Publishing new version on GitHub
- Updating version number and effective date
- No email notification (check GitHub for updates)

## 17. Compliance Certifications

InsightFlow uses Azure services with various compliance certifications:
- **ISO 27001, 27018**
- **SOC 1, 2, 3**
- **HIPAA** (requires BAA with Microsoft)
- **PCI DSS** (for payment card data)
- **FedRAMP** (for US government)

**Note:** You must configure resources appropriately for compliance.

## 18. Contact for Privacy Questions

For privacy-related questions:
- **GitHub Issues:** https://github.com/exon-sohan/insightflow-bicep-templates/issues

For Azure privacy questions:
- **Microsoft Privacy:** https://privacy.microsoft.com/

For Salesforce privacy questions:
- **Salesforce Privacy:** https://www.salesforce.com/privacy/

## 19. Data Processing Agreement (DPA)

If you require a DPA:
- **Azure DPA:** Available through Microsoft
- **InsightFlow DPA:** Contact us for enterprise agreements

## 20. Summary

**Key Points:**
- ✅ We do NOT access your data
- ✅ All data stays in YOUR Azure subscription
- ✅ YOU control all retention and deletion
- ✅ YOU are responsible for compliance
- ✅ Microsoft Azure processes data per their privacy commitments
- ✅ Azure OpenAI processes call content for analysis only

---

**Document Version:** 1.0.0
**Last Updated:** January 16, 2026
**Permanent URL:** https://github.com/exon-sohan/insightflow-bicep-templates/blob/v1.0.0/LEGAL.md
