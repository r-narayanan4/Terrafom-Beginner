# Iterate List using count

provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
}
resource "aws_instance" "ec2_example" {

    ami           = "ami-0183d80552093ddaf"
    instance_type =  "t3.micro"
    count = 1

    tags = {
        Name = "Terraform EC2"
    }

}

# Step 1: Create a list
variable "user_names" {
    description = "IAM usernames"
    type        = list(string)
    default     = ["user1", "user2", "user3"]
}

# Step 2: Use count to iterate
resource "aws_iam_user" "example" {
    count = length(var.user_names)
    name  = var.user_names[count.index]
}
