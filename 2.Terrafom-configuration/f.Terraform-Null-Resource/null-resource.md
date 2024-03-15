# Null Resource

## Overview

The `null_resource` in Terraform is a special resource that essentially does nothing. It is often used as a placeholder or for orchestration purposes where no real resource is needed, but some actions need to be performed as part of the Terraform execution plan.

### Key Points:

1. **Does Nothing**: As the name suggests, the `null_resource` does not create any actual resource on the cloud provider (e.g., AWS, Azure, GCP).

2. **Parameters**:
    - **Trigger** (optional): Specifies a list of values that, when changed, will trigger the execution of the provisioner block.
    - **Provisioner** (mandatory): Defines the action(s) to be executed when applied.

## Usage

### Defining a Null Resource

To define a `null_resource`, you need to specify at least one provisioner, which outlines the action(s) to be taken.

```h
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Hello, Terraform!'"
  }
}
```

## Why Do We Need It?

### Use Cases:

1. **Executing Commands**: You can use `null_resource` to execute arbitrary commands on the local machine or remote systems.

2. **Running Shell Scripts**: Integration with shell scripts allows for more complex configurations or actions.

3. **Running Ansible Playbooks**: Integrate Terraform with Ansible to manage infrastructure and perform configuration tasks.

4. **Running Python Programs**: Execute Python scripts for various automation tasks or custom logic.

### Important Concept: Trigger

The `trigger` block within a `null_resource` allows you to define dependencies or conditions that, when changed, will trigger the execution of the provisioner block. This ensures that actions are only performed when necessary.

for moringormation: [link](https://jhooq.com/terraform-null-resource/)