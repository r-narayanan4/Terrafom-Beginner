# Terraform Data Sources

## What is Terraform Data Sources?

Terraform data sources can be beneficial if you want to retrieve or fetch the data from the cloud service providers such as AWS, Azure, and GCP. Most of the time when we use Terraform along with AWS/Azure/GCP, we send data in terms of instructions or configuration.

But what if you want to get the information (ARN, tags, owner_id, etc.) back from the cloud service provider AWS/Azure/GCP?

Answer - We need to use the data sources to get the resource information back.

So Terraform Data Sources are a kind of an API that fetches the data/information from the resources running under the cloud infra and sends it back to Terraform configuration for further use.

## Resource vs. Data Source

| Feature             | Resource                                                     | Data Source                                                |
|---------------------|--------------------------------------------------------------|------------------------------------------------------------|
| **Purpose**         | Creates and manages infrastructure resources                 | Fetches information or data from external systems         |
| **Syntax**          | Uses `resource` keyword                                      | Uses `data` keyword                                        |
| **Usage**           | Used for provisioning and managing infrastructure components| Provides information for use within Terraform configuration|

For more detailed information and examples, you can refer to the following link: [Terraform Data Sources](https://jhooq.com/terraform-data-sources/)
