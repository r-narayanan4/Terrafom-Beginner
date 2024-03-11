# Iterate map using for_each

provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
}

# Create a map variable
variable "my_map" {
    type = map(string)
    default = {
        "user1" = "Admin-user"
        "user2" = "Developer-user"
        "user3" = "Analyst-user"
    }
}

#Step 2: Iterate over the map using for_each
resource "aws_iam_user" "example" {
    for_each = var.my_map

    #name  = each.key # prints keys as user-name
    name  = each.value # prints values as user-name
    
}