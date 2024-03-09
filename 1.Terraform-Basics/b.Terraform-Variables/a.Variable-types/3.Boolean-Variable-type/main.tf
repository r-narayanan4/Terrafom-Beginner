provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
} 


resource "aws_instance" "ec2_example" {
    ami           = "ami-0767046d1677be5a0"
    instance_type =  "t3.micro"
    count = 1
    associate_public_ip_address = var.enable_public_ip

    tags = {
        Name = "Terraform EC2"
        }

}

