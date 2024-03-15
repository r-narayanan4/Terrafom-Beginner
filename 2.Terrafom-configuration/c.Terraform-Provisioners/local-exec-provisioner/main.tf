# AWS Provider Configuration
provider "aws" {
    region     = "ap-south-2"                  # AWS region to operate in
    access_key = "your-access-key"        # Access key to authenticate Terraform with AWS
    secret_key = "your-secret-key" # Secret key to authenticate Terraform with AWS
} 


# AWS Instance Resource
resource "aws_instance" "ec2_example" {
    ami                    = "ami-0183d80552093ddaf"    # ID of the Amazon Machine Image (AMI) to use for the instance
    instance_type          = "t3.micro"                  # Instance type for the EC2 instance
    tags = {
        Name = "Terraform EC2"
    }


    provisioner "local-exec" {
    command = "touch hello.txt"
    }
}
