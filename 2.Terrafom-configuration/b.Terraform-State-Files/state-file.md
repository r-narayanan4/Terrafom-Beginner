# Terraform State Management

Terraform uses a state file to keep track of the resources it manages. This file, usually named `terraform.tfstate`, records the current state of your infrastructure.

## What is Terraform State?

Terraform state is a snapshot of the infrastructure resources managed by Terraform. It includes metadata about each resource, such as their attributes, dependencies, and relationships.

## How Does Terraform State Store Information?

The Terraform state file (`terraform.tfstate`) stores information about the infrastructure resources, including any changes made or planned. Before applying changes, Terraform updates the state file with the new configuration.

## Saving Terraform State File

### 1. Saving Locally

If you're the sole developer managing the infrastructure, Terraform automatically generates and saves the state file in your working directory when you run `terraform apply`.

### 2. Saving Remotely

For team collaboration, it's recommended to store the state file remotely, such as in an AWS S3 bucket. This ensures that all team members have access to the latest state and changes are synchronized.

## How to Use Terraform State File?

The Terraform state file is crucial for managing infrastructure. It's referenced during planning (`terraform plan`) and execution (`terraform apply`) to ensure changes are applied correctly.

## How to Manage Your Terraform State File?

Managing the Terraform state file involves choosing a storage backend and configuring it properly. Remote state management offers better collaboration and reliability compared to local storage.

## What is Terraform Local State?

Terraform local state refers to storing the state file within the local filesystem of the machine where Terraform commands are executed. It's suitable for individual developers or small projects.

## What is Terraform Remote State?

Terraform remote state involves storing the state file in a remote location, such as AWS S3 or Terraform Cloud. This facilitates collaboration, enables locking to prevent concurrent modifications, and provides better resilience.

For more detailed information, refer to the [Terraform State Management Guide](https://jhooq.com/terraform-manage-state/).
