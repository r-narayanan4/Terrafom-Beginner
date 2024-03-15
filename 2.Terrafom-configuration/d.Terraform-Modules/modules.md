# Terraform Modules

## Module

A Terraform module is a set of Terraform configuration files in a single directory. Even a simple configuration consisting of a single directory with one or more .tf files is a module. So in this sense, every Terraform configuration is part of a module.

## Root Module

When we run Terraform commands directly from a directory, it is considered the root module.

## Child Module

A module that is called by another configuration is referred to as a child module.

## Calling Module

Terraform commands will only directly use the configuration files in one directory, which is usually the current working directory. However, our configuration can use module blocks to call modules in other directories. When Terraform encounters a module block, it loads and processes that module's configuration files.

## Source Argument

When calling a module, the source argument is required. Terraform may search for a module in the Terraform registry that matches the given string. We could also use a URL or local file path for the source of our modules.

## Passing Variables to a Module

When calling a module, we may want to pass variables to the module. This is usually done in the module directive block.

## Types of Terraform Modules

Terraform lets you utilize prebuilt modules available through the Terraform registry or create custom modules to suit their needs. There are thousands of free modules in the Terraform registry that cater to different providers and use cases. But there are three primary types of modules in Terraform that you are likely to encounter:

- **Root Module**
- **Child Module**
- **Local Module (sample child module)**
- **Published Modules**

For further information, refer to the following resources:

- [Terraform Module](https://jhooq.com/terraform-module/)

- [List of Terraform Modules](https://spectralops.io/blog/list-of-terraform-modules/)
