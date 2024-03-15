/*How does Terraform null_resource work?
Terraform null_resource does not have a state which means it will be executed as soon as you run $ terraform apply command but no state will be saved.

Example - Please refer to the following code of null_resource -

Keep in mind when you execute $terraform apply command the null_resource will always execute it once.*/

#main.tf

provider "aws" {
    region     = "ap-south-2"

}

resource "aws_instance" "ec2_example" {
    ami           = "ami-0183d80552093ddaf"
    instance_type =  "t3.micro"
    tags = {
        Name = "Terraform EC2 "
    }
}

# The following null resource will print message "Hello World"
resource "null_resource" "null_resource_simple" {
    provisioner "local-exec" {
        command = "echo Hello World"
    }
}

