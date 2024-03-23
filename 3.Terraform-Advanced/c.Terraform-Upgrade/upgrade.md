# Terraform Upgrade Utility

Terraform Upgrade Utility is a tool designed to manage different versions of Terraform, allowing users to seamlessly switch between versions as needed. This utility, called Terraform Version Manager (tfenv), assists in installing and managing various Terraform versions on your development machine. It's important to note that tfenv doesn't come pre-installed with Terraform and needs to be installed separately.

## Why do we need Terraform Version Manager?

In the typical software development cycle, Terraform regularly releases new versions containing bug fixes and new features. However, sometimes newer versions of Terraform may render certain providers or plugins unstable or incompatible. In such scenarios, you may need to either rollback to a previous Terraform version or upgrade to a newer one. Terraform Version Manager provides a solution for managing these scenarios by allowing users to switch between different Terraform versions seamlessly.

## How to Install?

To install Terraform Version Manager (tfenv), please refer to the following link: [tfenv GitHub Repository](https://github.com/tfutils/tfenv)

## Commands

Use the following commands to manage Terraform versions using tfenv:

- `tfenv list-remote`: Lists all available remote versions of Terraform.
- `tfenv install 1.2.4`: Installs a specific version of Terraform (e.g., version 1.2.4).
- `tfenv install 1.2.3`: Installs another specific version of Terraform (e.g., version 1.2.3).
- `tfenv use 1.2.3`: Switches to using a specific version of Terraform (e.g., version 1.2.3).
- `tfenv install latest`: Installs the latest version of Terraform available.

You can install multiple versions of Terraform using tfenv and specify which version to use for your Terraform projects.

By utilizing Terraform Version Manager, managing multiple Terraform versions becomes effortless, enabling smoother development workflows and easier compatibility management.
