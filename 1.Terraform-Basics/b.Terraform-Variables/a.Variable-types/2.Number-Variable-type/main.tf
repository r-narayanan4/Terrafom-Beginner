provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
} 

resource "aws_instance" "ec2_example" {
    ami = "ami-0183d80552093ddaf"  
    instance_type = "t3.micro" 
    count = var.instance_count
    tags = {
        Name = "Terraform EC2"
    }
}
