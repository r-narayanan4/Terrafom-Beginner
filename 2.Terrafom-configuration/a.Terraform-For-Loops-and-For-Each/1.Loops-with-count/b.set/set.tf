# Iterate Set using count

provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
}

#Step 1: Create a set
variable "my_set" {
    description = "IAM usernames"
    type    = set(string)
    default = ["user1", "user2", "user3"]
}

#Step 2: Convert set to list
locals {
    my_list = tolist(var.my_set)
}

#Step 3: Use count to iterate
resource "aws_iam_user" "example" {
    count = length(local.my_list)

    name = local.my_list[count.index]

}

