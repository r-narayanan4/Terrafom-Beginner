# Resource to create EC2 instance

resource "aws_instance" "ec2_example" {
    ami = "ami-0183d80552093ddaf"  
    instance_type = var.instance_type 
    tags = {
        Name = var.tag
    }
}
