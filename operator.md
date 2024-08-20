## Azure Cognitive Service Language

Azure Cognitive Services Language provides advanced capabilities to process natural language, allowing applications to perform tasks such as sentiment analysis, language detection, key phrase extraction, and more.

### Design Decisions

- **Modularity**: This module is designed to allocate a specific Cognitive Services Language resource within Azure, configured for Text Analytics capabilities.
- **Scalability**: The module allows specifying SKU names to adjust the scale and performance of the service.
- **Customization**: Tags and custom subdomain names can be specified to align the resource with organizational policies.

### Runbook

#### Issue: Service Unavailable

If you encounter a "Service Unavailable" error, the service might be down or experiencing connectivity issues.

Check the status of the Azure Cognitive Services:

```sh
az cognitiveservices account show --name "your-account-name" --resource-group "your-resource-group"
```

Ensure the service is running and check the `provisioningState`.

#### Issue: Authentication Failure

You may come across authentication errors when trying to access the Azure Cognitive Service Language. 

Check the service principal details:

```sh
az ad sp show --id "your-service-principal-id"
```

Verify that the client ID, tenant ID, and client secret are correctly configured.

#### Issue: Insufficient Permissions

If you receive a permission error, ensure that your IAM roles are correctly assigned.

List IAM roles assigned to the cognitive service:

```sh
az role assignment list --scope "/subscriptions/your-subscription-id/resourceGroups/your-resource-group/providers/Microsoft.CognitiveServices/accounts/your-account-name"
```

Ensure roles such as `Cognitive Services Language Reader` and `Cognitive Services Language Writer` are properly assigned.

#### Issue: Incorrect Endpoint

If the endpoint seems to be causing problems, ensure you are using the correct one.

Retrieve the endpoint:

```sh
az cognitiveservices account show --name "your-account-name" --resource-group "your-resource-group" --query "properties.endpoint"
```

Verify that it's being used correctly in your configurations.

#### Issue: Text Analytics Not Responding

If the Text Analytics feature is not responding or returning errors, you may want to investigate further at the service level.

Test the Text Analytics endpoint using a simple HTTP request:

```sh
curl -X POST "your-endpoint/text/analytics/v3.1/sentiment" \
    -H "Ocp-Apim-Subscription-Key: your-subscription-key" \
    -H "Content-Type: application/json" \
    --data-raw '{
      "documents": [
        {
          "language": "en",
          "id": "1",
          "text": "The quick brown fox jumps over the lazy dog."
        }
      ]
    }'
```

Check the response for any errors or issues.

