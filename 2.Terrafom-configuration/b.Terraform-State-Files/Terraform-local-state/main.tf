# Configure AWS provider with authentication credentials and region
provider "aws" {
    region     = "ap-south-2"                         # AWS region to operate in
    access_key = "your-access-key"               # Access key to authenticate Terraform with AWS
    secret_key = "your-secret-key"  # Secret key to authenticate Terraform with AWS
} 

# Define an AWS EC2 instance resource
resource "aws_instance" "ec2_example" {
    ami           = "ami-0183d80552093ddaf"           # ID of the Amazon Machine Image (AMI) to use for the instance
    instance_type = var.instance_type                 # Instance type defined in a variable
    tags = {
        Name = "Terraform EC2"                       # Name tag for the EC2 instance
    }
}
