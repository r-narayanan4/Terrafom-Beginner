# Iterate map using count

provider "aws" {
    region     = "ap-south-2"
    access_key = "your-access-key"
    secret_key = "your-secret-key"
}

#Step 1: Create a map variable
variable "my_map" {
    type = map(string)
    default = {
        "user1" = "Admin-user"
        "user2" = "Developer-user"
        "user3" = "Analyst-user"
    }
}

#Step 2: Fetch keys of map
locals {
    my_keys = keys(var.my_map)
}

#Step 3: iterate over map using keys and count.index meta argument
resource "aws_iam_user" "example" {
    count = length(local.my_keys)

    #name  = local.my_keys[count.index] # creates {key names as user}
    name = var.my_map[local.my_keys[count.index]] # Creates {values name as user}

}

