# Terraform Input Variables

## Introduction

Terraform input variables are placeholders for values that can be used to customize Terraform configurations and deployments. These variables allow for greater flexibility and reusability in infrastructure as code (IaC) projects.

## Declaring Terraform Variables

Terraform variables can be declared in several ways:

- **Inline**: Directly within the Terraform configuration files.
- **External**: In separate variable files such as `variable.tf`.
- **Environment Variables**: Passed as environment variables during Terraform execution.

## Types of Terraform Variables

Terraform supports various types of variables including:

- **String**: Textual data.
- **Number**: Numeric values.
- **Bool**: Boolean values (true/false).
- **List**: An ordered collection of values.
- **Map**: A set of key-value pairs.

## `variable.tf` File

`variable.tf` is a file where Terraform variables are typically declared. This file helps organize and manage input variables separately from the main configuration.

## `terraform.tfvars` File

`terraform.tfvars` is a file where variable values can be assigned. This file allows for easy management of variable values without modifying the Terraform configuration files directly.

## Handling Multiple `terraform.tfvars` Files

To handle multiple `terraform.tfvars` files, you can specify the desired file using the `-var-file` option during Terraform execution. This allows you to switch between different sets of variable values for different environments or scenarios.

### Example Usage

Suppose you have two `terraform.tfvars` files, `dev.tfvars` and `prod.tfvars`, containing environment-specific variable values. You can apply these variable values as follows:

```bash
# Apply Terraform configuration using dev.tfvars
terraform apply -var-file=dev.tfvars

# Apply Terraform configuration using prod.tfvars
terraform apply -var-file=prod.tfvars

```

## Setting Variable Value Using Command Line `var`

To set a variable value using the command line, you can use the `-var` option followed by the variable name and value. This allows you to override the default or `terraform.tfvars` values directly from the command line.

### Example Usage

Suppose you have a variable `instance_count` in your Terraform configuration, and you want to set it to `3` during the Terraform apply process. You can use the following command:

```bash
terraform apply -var="instance_count=3"

```

## Terraform Output Variables

In Terraform, output variables allow you to easily extract information about the resources that were created by Terraform. They allow you to easily reference the values of resources after Terraform has finished running.

Output variables are defined in the outputs block in the Terraform configuration file. Here's an example of an output variable that references the IP address of an EC2 instance:

```h
output "instance_ip" {
   value = aws_instance.example.public_ip
}
```

In this example, the output variable is named "instance_ip" and its value is set to the public IP of an EC2 instance named "example" that is defined in the Terraform configuration.

## Terraform output command

You can use the `terraform output` command to access the value of an output variable:

```bash
terraform output instance_ip

# It will print Ip address
52.11.222.33
```

For more information about Terraform input variables, you can refer to [Terraform variables](https://jhooq.com/terraform-input-variables/).
