# Changing Terraform Variable Values via Command Line

To change the variable values using the command line in Terraform, you can specify the new variable values directly using the `-var` flag followed by the variable name and its new value.

## Example

Suppose you want to change the instance type variable (`instance_type`) from `t3.micro` to `t3.small`. Here's how you can do it:

```bash
terraform apply -var="instance_type=t3.small"
```