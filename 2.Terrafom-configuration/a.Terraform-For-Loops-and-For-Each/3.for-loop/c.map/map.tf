provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
}


# Define a variable containing IAM users and their roles
variable "iam_users" {
    description = "IAM users with their roles"
    type        = map(string)
    default = {
        "user1" = "Admin-user"
        "user2" = "Developer-user"
        "user3" = "Analyst-user"
    }
}

# Create IAM users based on the provided map
resource "aws_iam_user" "example" {
    # Iterate over the keys (usernames) of the iam_users map
    for_each = { for k, v in var.iam_users : k => k }

    # Use the username as the name of the IAM user
    name = each.key
}

# Define an output to display IAM users with their roles
output "user_with_roles" {
    # Construct a list of strings showing usernames and their corresponding roles
    value = [for name, role in var.iam_users : "${name} is the ${role}"]
}
