# Terraform Locals

## Overview

Terraform Locals provide a way to define values within a Terraform configuration file. They can hold both static and dynamic values, offering flexibility in managing configuration data.

### Example

```h
## Example of local with static value 

locals {
  my_local = "value"
}
```

As you can see in the above code locals are very easy to define.

Here are the key properties of locals -

Static Value - Terraform local can retain static value
Dynamic Value - You can also assign dynamic value to Terraform local

```h
## Example of local with dynamic value 

locals {
  my_local = "${var.my_variable_value}"
}
```

## 1. Terraform Locals in a nutshell

Let's talk about the scope and visibility. Terraform Locals are only accessible within that functions or within the scope of terraform file. Here are few more points which you should take into consideration for the value assignment -

- Value assignment- Terraform locals do not change their value once it is assigned, you have to re-assign a new value.

- Power of Expression- Apart from static value assignment terraform locals can use the power of expression, so instead of writing the same expression the multiple times through the terraform configuration, you can declare a terraform locals and use the same terraform locals at other places.

Example with expression 

```h
 locals {
  my_local = "${var.ec2_instance_name}"
}
```

Example without expression 

```bash
 locals {
  my_local = "t2.micro"
}
```

## Benefits of Using Terraform Locals

When working on large enterprise infrastructure projects, leveraging Terraform Locals becomes indispensable. Let's delve deeper into the benefits of utilizing Terraform locals:

1. **Reusable:** Terraform locals allow you to define values once and reuse them multiple times throughout the Terraform configuration file. This significantly enhances code reusability and maintainability.

2. **Reduced Redundancy:** By centralizing values within Terraform locals, updates and modifications become streamlined. Instead of manually updating values in multiple places within the configuration, you only need to modify the local value once. This ensures consistency across your infrastructure deployment and reduces the risk of errors.

For further information, you can visit the [link](https://jhooq.com/how-to-use-terraform-locals/#1-terraform-locals-in-a-nutshell).


