# Terraform Debugging and Validation

This document provides a guide to enabling debugging and implementing variable validation in your Terraform projects.

## Debugging

Debugging helps you identify configuration issues and understand Terraform's execution flow.

**Setting Log Levels:**

Terraform supports various log levels to control the verbosity of output:

- **DEBUG:** Provides detailed information, including function calls, variable values, and internal operations.
- **TRACE:** Offers even more granular details, useful for deep troubleshooting.
- **INFO:** (Default) Shows essential information like resource creation, updates, and deletions.
- **WARN:** Highlights potential issues that might not prevent execution but need attention.

**Enabling Debugging:**

There are two primary ways to enable debugging:

**1. Environment Variables:**

- Set the `TF_LOG` environment variable to your desired log level (e.g., `DEBUG`, `INFO`, `WARN`, `TRACE`).
- Set the `TF_LOG_PATH` environment variable to specify the path for the log file. For example:

     ```bash
     export TF_LOG=DEBUG  # Set the log level to DEBUG
     export TF_LOG_PATH=~/terraform.log  # Store logs in ~/terraform.log
     ```

**2. Command-Line Flags (Alternative):**

- Pass the `-debug` flag to Terraform commands to enable DEBUG logging:

     ```bash
     terraform plan -debug
     ```

- Combine `-debug` with `-log-level` and a level (DEBUG, INFO, WARN, or TRACE) to customize the log level:

     ```bash
     terraform plan -debug -log-level=WARN
     ```

**Viewing Logs:**

The log file specified in `TF_LOG_PATH` will store Terraform's output. You can view it using your preferred text editor or terminal.

## Validation


**Enforce Variable Constraints:**

Terraform allows validating variable values using the `validation` block within a variable definition. This ensures your configuration adheres to specific criteria.

**Example: Validating Instance Types:**

```bash
variable "instance_type" {
  description = "EC2 instance type (only t3 allowed)"
  type        = string
  default     = "t3.micro"

  validation {
    condition = can(regex("^[Tt]3.(nano|micro|small)", var.instance_type))
    error_message = "Invalid Instance Type name. Only t3 instance types (t3.nano, t3.micro, t3.small) are allowed."
  }
}
```
