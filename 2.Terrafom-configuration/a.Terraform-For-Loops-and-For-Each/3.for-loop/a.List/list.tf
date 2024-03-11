provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
}

# Create a set
variable "user_names" {
    description = "IAM usernames"
    type        = list(string)
    default     = ["user1", "user2", "user3"]
}

resource "aws_iam_user" "example" {
    # Iterate over the list using for loop
    for_each = { for idx, name in var.user_names : idx => name }

    name = each.value
}

output "print_the_names" {
    value = var.user_names
}
