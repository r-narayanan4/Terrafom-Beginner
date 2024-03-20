# Terraform Template

Terraform templates dynamically generate configuration files based on the state of your infrastructure or other external variables. Templates are perfect for dynamically creating cloud-init scripts, cloud-config files, or any other configuration files requiring variable data to be filled at runtime.

Terraform templates enable the embedding of variables, expressions, and loops within HCL strings, allowing the generation of complex infrastructure configurations. By using template interpolation syntax `${ ... }`, users can embed variables and expressions, which are evaluated during the template rendering process.

Templates are typically stored in separate files with a `.tpl` or `.tf.tpl` extension, and they can be read and rendered using the `template_file` data source. This dynamic capability makes it possible to create multiple similar resources with varying attributes, adapt configurations to different environments, and automate repetitive tasks.

## Terraform Template Extension

There are two popular extensions with which you can save the Terraform Template:

- `.tpl`
- `.tftpl`

For more information, refer to the following resources:

- [jhooq.com/terraform-template](https://jhooq.com/terraform-template/?query=temp)
- [spacelift.io/blog/terraform-templates](https://spacelift.io/blog/terraform-templates)
- [kodekloud.com/blog/terraform-template](https://kodekloud.com/blog/terraform-template/)

1. How to use terraform output as input variable of another terraform template - [Stack Overflow Link](https://stackoverflow.com/questions/41596412/how-to-use-terraform-output-as-input-variable-of-another-terraform-template)

2. Convert Terraform Templates to CloudFormation Templates - [Stack Overflow Link](https://stackoverflow.com/questions/47065279/convert-terraform-templates-to-cloudformation-templates)

**Deprecated:**
Please note that the usage of `template_file` resource in Terraform is deprecated. Consider using `templatefile` function instead.

```hcl
data "template_file" "policy" {
  template = file("${path.module}/policy.tpl")

  vars = {
    name = "RLN"
  }
}
```

**Locals:*

This block defines a local value named `policy` using the `templatefile` function, which renders a template file named `policy.tpl`. It passes a variable `name` with the value "RLN" to the template file. Locals are used to store values that can be reused within the configuration without having to repeat complex expressions.

```hcl
locals {
  policy = templatefile("${path.module}/policy.tpl", {
    name = "RLN"
  })
}
```

**Data Source:**

This block defines a null data source named `policy`. It utilizes the `templatefile` function to render a template file named `policy.tpl`, passing "RLN" as the value for the `name` variable. Null data sources in Terraform are used to perform computations or operations without creating any actual resources. In this case, it's used to generate a policy without creating any real data.

```hcl
data "null_data_source" "policy" {
  inputs = {
    policy = templatefile("${path.module}/policy.tpl", {
      name = "RLN"
    })
  }
} 
```

**IAM Policy Resource:**

This block defines an AWS IAM policy resource named `default`. It utilizes the `templatefile` function to render a template file named `policy.tpl`. However, in this instance, it passes "Justin" as the value for the `name` variable. IAM policies in AWS are used to define permissions for various AWS resources. By using Terraform's template rendering capabilities, dynamic policy content can be generated based on the provided values.

```hcl
resource "aws_iam_policy" "default" {
  policy = templatefile("${path.module}/policy.tpl", {
    name = "Justin"
  })
}
```
