# Terraform Provisioners

Terraform Provisioners are used for performing custom actions and tasks either on the local machine or on the remote machine during the Terraform resource provisioning process.

## Overview

Provisioners in Terraform allow for executing scripts or commands on a local or remote machine to perform actions such as running custom shell scripts, copying files, or executing commands remotely.

### Types of Provisioners

#### Generic Provisioners

- **file**: For transferring files or directories between machines securely using SSH or WinRM.
- **local-exec**: Executes commands on the local machine where Terraform is running.
- **remote-exec**: Executes commands on the remote machine, typically over SSH or WinRM.

#### Vendor Provisioners

- **Chef, Habitat, Puppet, Salt-masterless**: Vendor-specific provisioners for automating server configuration. They are only compatible with their respective vendors.

## File Provisioner

The file provisioner is used to transfer files or directories between machines securely. It supports SSH and WinRM connections for secure data transfer.

## Local Provisioner

The local-exec provisioner is used to execute commands or scripts on the local machine where Terraform is running. It is useful for performing local operations during resource provisioning.

## Remote Provisioner

The remote-exec provisioner executes commands or scripts on the remote machine. It allows specifying shell commands to be executed remotely, typically over SSH or WinRM.

### Security Considerations

All communication and file transfers performed by provisioners are done securely using protocols like SSH or WinRM.

For more information and examples, refer to the [Terraform Provisioner Guide](https://jhooq.com/terraform-provisioner/).
