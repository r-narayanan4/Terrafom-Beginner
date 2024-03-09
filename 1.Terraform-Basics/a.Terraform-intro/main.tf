provider "aws" {
  region     = "ap-south-2"
  access_key = "yourkey"
  secret_key = "yourkey"
} 

resource "aws_instance" "ec2_example" {
    ami = "ami-0183d80552093ddaf"  
    instance_type = "t3.micro" 
    tags = {
        Name = "Terraform EC2"
    }
}
