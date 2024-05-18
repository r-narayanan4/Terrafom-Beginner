provider "aws" {
    region = "ap-south-2"
    shared_credentials_files = ["C:\\Users\\RLnar\\.aws\\credentials"]
}

# terraform import aws_instance.ec2_example i-01e7dc8cb7d60e050
# terraform show

resource "aws_instance" "myvm" {
    ami           = "ami-02c44bfb8471e946d"
    instance_type = "t3.micro"
}

