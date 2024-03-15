resource "aws_instance" "example" {
    ami           = var.ami                  # Use the AMI ID defined in the 'ami' variable
    instance_type = var.instance_type        # Use the instance type defined in the 'instance_type' variable
    subnet_id     = var.subnet_id            # Use the subnet ID defined in the 'subnet_id' variable        
#   key_name      = var.key_name             # Use the key pair defined in the 'key_name' variable

    tags = {
        Name = var.name                        # Use the name defined in the 'name' variable for tagging
    }
}

