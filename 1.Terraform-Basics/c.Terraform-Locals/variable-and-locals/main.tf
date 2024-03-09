# Provider configuration
provider "aws" {
    region     = "ap-south-2"
    access_key = "Your-key"
    secret_key = "Your-key"
}

# Resource definitions
resource "aws_instance" "example_server" {
    ami           = "ami-0767046d1677be5a0"
    instance_type = "t3.micro"

# Using locals to generate the server name
    tags = {
        Name = local.server_details
    }
}
