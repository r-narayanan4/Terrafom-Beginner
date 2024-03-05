# Terraform

## What is Terraform?

Terraform is used to provision and set up your infrastructure on a cloud platform.

## What is Provisioning and Setting Up Your Infrastructure?

Provisioning and setting up your infrastructure involves creating servers or virtual machines to deploy your application. Terraform simplifies this process by automating the creation of infrastructure components using Terraform configuration files. Instead of manually configuring resources on a cloud provider like AWS, Terraform handles the provisioning and installation of necessary software packages.

## Terraform Configuration Files

A Terraform file, typically with a `.tf` extension, contains two main components: the provider and the resource. Here's an example:

```h
provider "aws" {
  // Provider configuration
}

resource "aws_instance" {
  // Resource configuration
}
```

## Explanation of the File Components

- **Provider:** Specifies the cloud service provider and its configuration.
- **Resource:** Defines the infrastructure resources to be created, such as EC2 instances.

## Terraform Commands

Terraform commands are used to interact with cloud service providers and manage infrastructure.

- `terraform init`: Prepares the local environment for setting up your cloud infrastructure.
- `terraform plan`: Displays the execution plan, showing the changes to be made (additions, updates, deletions).
- `terraform apply`: Executes the plan, creating or modifying resources on the cloud provider.
- `terraform destroy`: Deletes all instances or resources created by the previous terraform apply command.


## Explanation of Terraform Commands

### terraform init

When you run `terraform init`, Terraform contacts the cloud service provider and downloads all required dependencies onto your local system. This includes plugins and modules necessary for interacting with the cloud provider. After running `terraform init`, you will find a `.terraform` directory in the same directory as your Terraform configuration file (`main.tf`). This directory contains the downloaded packages needed for interacting with your cloud service provider.

### terraform plan

Running `terraform plan` displays an execution plan in your terminal. This plan outlines the changes Terraform will make to your infrastructure. It indicates the number of resources to be added, changed, or destroyed. However, this command does not actually create or modify any resources on the cloud provider. It only informs you about the proposed changes.

### terraform apply

`terraform apply` is the command where the actual changes to your infrastructure occur. After running this command, Terraform communicates with the cloud provider (such as AWS, GCP, or Azure) to create the specified resources. For example, if you've configured Terraform to create virtual machines in your `.tf` file, this command will create those virtual machines on the cloud provider.

### terraform destroy

The `terraform destroy` command removes all resources created by Terraform. It essentially reverses the changes made during the `terraform apply` process, deleting all infrastructure components provisioned by Terraform.

## Files Created by Terraform

### During terraform init

- **.terraform directory:** Contains all dependencies and plugins required for interacting with the cloud provider.
  
- **terraform.lock.hcl:** This file locks the provider versions to ensure consistency across different runs of Terraform.This file helps ensure that Terraform always uses the same versions of providers and modules across different runs of your Terraform configuration. It prevents unexpected changes caused by updates to provider versions, ensuring consistency and reproducibility in your infrastructure deployments.

## Terraform State Files

After running `terraform apply`, Terraform generates and manages state files to keep track of the infrastructure it manages. Here are the relevant files:

### terraform.tfstate

- This file maintains the state of your infrastructure.
- It records the current state of resources managed by Terraform, including their attributes and dependencies.
- Terraform references this file to determine the desired state of resources and to plan and execute changes during subsequent runs.

### terraform.tfstate.backup

- This file is a backup of the previous state file (`terraform.tfstate`) before any modifications were made.
- It provides a fallback in case of errors or corruption in the primary state file.
- Keeping a backup helps ensure that you can revert to the previous state if needed, providing an additional layer of safety and reliability in your infrastructure management process.

### terraform.tfstate.lock.info

- This file is automatically created by Terraform to manage state locking.
- It helps prevent concurrent modifications to the Terraform state file by multiple users or processes.
- Manually modifying or deleting this file is not recommended, as it could lead to conflicts or data corruption in the Terraform state management process.

It's essential to handle these state files carefully to maintain the consistency and integrity of your infrastructure. Avoid manual modifications to these files and ensure that they are properly managed and backed up to prevent data loss or inconsistencies.
