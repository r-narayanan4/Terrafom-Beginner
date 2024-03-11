# Iterate set using for_each

provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
}

# Create a set
variable "user_names" {
    description = "IAM usernames"
    type        = set(string)
    default     = ["user1", "user2", "user3"]
} 

resource "aws_iam_user" "example" {
    for_each = var.user_names
    name  = each.value
}
