# Iterate set using for

provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
}

#Step 1: Create a set
variable "my_set" {
    type    = set(string)
    default = ["user1", "user2", "user3"]
}

#Step 2: Conver it to the list
locals {
    my_list = tolist(var.my_set)
}

#Step 3: Use for loop
resource "aws_iam_user" "example" {
    for_each = { for idx, value in local.my_list : idx => value }

    name = each.value

} 

