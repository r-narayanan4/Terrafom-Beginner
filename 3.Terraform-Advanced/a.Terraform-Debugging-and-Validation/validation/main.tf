provider "aws" {
  region     = "ap-south-2"
} 

# Resource to create an EC2 instance

resource "aws_instance" "ec2_example" {
  # Amazon Machine Image (AMI) ID for the instance
  ami           = "ami-0183d80552093ddaf"  # Update with your desired AMI

  # Instance type (dynamically assigned from the 'instance_type' variable)
  instance_type = var.instance_type

  # Tags to associate with the instance
  tags = {
    Name = "Terraform EC2"  # Descriptive name for the instance+-
  }

}

# Variable to define the instance type

variable "instance_type" {
  description = "EC2 instance type (e.g., t2.micro, t3.micro)"
  type        = string
  default     = "t2.micro"  # Adjust the default if needed

  validation {
    condition = can(regex("^[Tt] [3].(nano|micro|small)", var.instance_type))
    error_message = "Invalid Instance Type name. You can only choose -t3.nano,t3.micro,t3.small"  # Updated to allow t3.micro
  }
}
