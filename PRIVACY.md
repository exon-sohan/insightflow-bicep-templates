# Privacy Policy - InsightFlow

**Effective Date:** January 16, 2026
**Version:** 1.0.0

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
- **Email:** [Your privacy contact email]

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

**Last Updated:** January 16, 2026
**Version:** 1.0.0
