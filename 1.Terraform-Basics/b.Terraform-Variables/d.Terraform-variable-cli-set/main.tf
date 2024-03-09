# main.tf

# Creating an EC2 instance
resource "aws_instance" "ec2_example" {
    ami           = var.ami_id # Using the AMI ID specified in variables
    instance_type = var.instance_type # Using the instance type specified in variables
    tags          = {
        Name = var.tag
    } # Using the tags specified in variables
}
