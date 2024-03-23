# Terraform Import

## Introduction

Terraform is an infrastructure as code (IaC) tool that allows you to manage and provision your infrastructure through code. When using Terraform, you define your infrastructure resources in configuration files (typically written in HashiCorp Configuration Language - HCL), and Terraform takes care of provisioning and managing those resources for you.

However, there might be scenarios where you already have existing infrastructure resources that were not provisioned using Terraform. In such cases, you can use the `terraform import` command to import those existing resources into your Terraform configuration. This allows you to manage those resources alongside the rest of your infrastructure using Terraform.

## Why do we need `terraform import`?

## Seamless Management

One of the primary reasons for using `terraform import` is to achieve seamless management of all your infrastructure resources through Terraform. By importing existing resources, you bring them under Terraform's control, enabling you to manage their configuration, lifecycle, and dependencies alongside other resources defined in your Terraform codebase.

## Infrastructure as Code (IaC) Consistency

Adopting infrastructure as code practices promotes consistency, repeatability, and automation in managing infrastructure. By importing existing resources into Terraform, you ensure that all infrastructure changes follow the same IaC processes, regardless of whether they were initially provisioned manually or through other means.

## Resource Tracking and Versioning

Importing existing resources into Terraform allows you to track changes and version your infrastructure configuration using source control systems like Git. This provides visibility into resource modifications, simplifies collaboration among team members, and enables rollback to previous states if necessary.

## Dependency Management

Terraform manages dependencies between resources declared in its configuration files. By importing existing resources, you can explicitly define dependencies between them and other Terraform-managed resources, ensuring proper provisioning order and consistency in your infrastructure deployments.

## How to Use `terraform import`

## Prerequisites

Before using `terraform import`, ensure that you have:

- Terraform installed on your system.
- A Terraform configuration file (usually named `main.tf`) defining the resources you want to import.
- Knowledge of the resource identifiers or provider-specific IDs for the existing resources you wish to import.

## Usage

To import existing resources into Terraform, follow these steps:

1. **Define Resource Configuration**: Ensure that your Terraform configuration file (`main.tf`) includes resource definitions for the resources you want to import. These definitions should match the existing resources' configurations as closely as possible.

2. **Run `terraform import` Command**: Use the `terraform import` command followed by the resource type and resource identifier to import each resource individually. For example:

   ```bash
   terraform import aws_instance.my_instance i-1234567890abcdef0
   ```


## Verify and Update Configuration

After importing resources, review your Terraform configuration to ensure that it accurately reflects the imported resources' attributes and dependencies. Make any necessary adjustments to align the configuration with your desired state.

## Apply Changes

Once you've imported the resources and updated your Terraform configuration, apply the changes using the `terraform apply` command to synchronize your infrastructure with the updated configuration.

## Conclusion

In summary, `terraform import` is a powerful feature of Terraform that enables you to bring existing infrastructure resources under Terraform management. By importing resources, you can achieve consistency, version control, and dependency management for your infrastructure, facilitating seamless integration into your infrastructure as code workflows.

For detailed usage instructions, refer to the [Terraform Import Resource Documentation](https://jhooq.com/terraform-import-resource/).
