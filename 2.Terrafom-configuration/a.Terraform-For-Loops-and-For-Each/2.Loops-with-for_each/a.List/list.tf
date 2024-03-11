# Iterate list using for_each

provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
}

# Create a set
variable "my_list" {
    description = "IAM usernames"
    type    = list(string)
    default = ["user1", "user2", "user3"]
}

resource "aws_iam_user" "example" {

    # Convert list to set using toset() function 
    for_each = toset(var.my_list)

    # Iterate over the list
    name = each.value

}