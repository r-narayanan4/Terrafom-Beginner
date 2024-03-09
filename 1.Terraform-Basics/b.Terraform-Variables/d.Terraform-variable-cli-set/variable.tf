# variable.tf

# Declaring variables for AWS configuration
variable "aws_region" {
    description = "AWS region"
    type        = string
}

variable "aws_access_key" {
    description = "AWS access key"
    type        = string
}

variable "aws_secret_key" {
    description = "AWS secret key"
    type        = string
}

# Declaring variables for EC2 instance configuration
variable "tag" {
    description = "Tags for the EC2 instance"
    type        = string
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
}

variable "instance_type" {
    description = "Instance type for the EC2 instance"
    type        = string
}
