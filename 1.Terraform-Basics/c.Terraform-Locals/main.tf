provider "aws" {
    region     = "ap-south-2"
    access_key = "your-key"
    secret_key = "Your-key"
}

locals {
    staging_env = "staging"
}

resource "aws_vpc" "staging-vpc" {
    cidr_block = "10.5.0.0/16"

    tags = {
        Name = "${local.staging_env}-vpc-tag"
    }
}

resource "aws_subnet" "staging-subnet" {
    vpc_id = aws_vpc.staging-vpc.id
    cidr_block = "10.5.0.0/16"

    tags = {
        Name = "${local.staging_env}-subnet-tag"
    }
}

resource "aws_instance" "ec2_example" {
    ami           = "ami-0767046d1677be5a0"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.staging-subnet.id

    tags = {
        Name = "${local.staging_env} - Terraform EC2"
    }
}

