# provider.tf

# AWS provider configuration
provider "aws" {
    region     = var.aws_region # Using the region specified in variables
    access_key = var.aws_access_key # Using the access key specified in variables
    secret_key = var.aws_secret_key # Using the secret key specified in variables
}
