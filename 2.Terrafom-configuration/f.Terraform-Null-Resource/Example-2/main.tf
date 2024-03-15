/*What is the trigger inside null_resource?
The trigger is a block inside the null_resource which holds key-value pair. But to understand the trigger please have look at the following points -

As the name suggest trigger, it will execute local-exec, remote-exec or data block.
trigger will only work when it detects the change in the key-value pair
trigger can only work once if key-value is changed once but on the other hand if the key-value pair changes its value every time it will execute the every time you run $terraform apply command.*/

#main.tf 

provider "aws" {
    region     = "ap-south-2"

}

resource "aws_instance" "ec2_example" {
    ami           = "ami-0767046d1677be5a0"
    instance_type =  "t2.micro"
    tags = {
        Name = "Terraform EC2 "
    }
}

# The following null resource has the trigger
resource "null_resource" "null_resource_simple" {

# This trigger will only execute once when it detects the instance id of EC2 instance 
    triggers = {
        id = aws_instance.ec2_example.id    # to execute it every time replace - id = time()
    }
    provisioner "local-exec" {
        command = "echo Hello World"
    }
}
