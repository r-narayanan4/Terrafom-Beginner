# AMI ID for the EC2 instance.
variable "ami" {
    description = "The AMI ID for the EC2 instance."
}

# Instance type for the EC2 instance.
variable "instance_type" {
    description = "The instance type for the EC2 instance."
}

# Subnet ID for the EC2 instance.
variable "subnet_id" {
    description = "The subnet ID for the EC2 instance."
    default = ""
}

#Key pair to associate with the EC2 instance.
# variable "key_name" {
#     description = "Key pair to associate with the EC2 instance."
# }

# Name of the EC2 instance.
variable "name" {
    description = "The name of the EC2 instance."
}
