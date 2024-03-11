# Terraform Loop Concepts

For understanding Terraform loops, please refer to the following link:

[https://jhooq.com/terraform-for-and-for-each-loop/](https://jhooq.com/terraform-for-and-for-each-loop/)

## Here is the difference between list and map syntax

## For list -

```bash

{for <ITEM> in <LIST> : <OUTPUT_KEY> => <OUTPUT_VALUE>}

## For Map 

{for <KEY>, <VALUE> in <MAP> : <OUTPUT_KEY> => <OUTPUT_VALUE>} 

```

## What is the difference between `for_each` and `count`?

`for_each` and `count` are both used to make multiple copies of a resource, but they work in very different ways.

1. count : count is an argument that takes a integer value that tells how many copies of a resource to make. When you use count, each instance gets a number (starting with 0), which you can use to get to that instance.

## Example: If you wanted to create three instances of an aws_instance, you might use a configuration like this:

```h

# Following terraform code will create 3 instances of ec2

resource "aws_instance" "example" {
  count = 3

  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

In the above example, Terraform will create three AWS instances with the same ami and instance_type. You can refer to these instances with aws_instance.example[count.index].

2.for_each : This option can be either a map or a set of strings. For each item in the map or set of strings, a new instance is made. The map or set gives each instance a key that can be used to get to that instance.

```h

# Iterate over the amis set defined in the variable 
# The followig resource will create two ec2 instances. 

resource "aws_instance" "example" {
  for_each      = var.ami_id
  ami           = each.value
  instance_type = "t2.micro"
}

variable "ami_id" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["ami-0c55b159cbfafe1f0", "ami-083ac7c7ecf9bb9b0"]
}
```

In the above example, Terraform will create two AWS instances with the ami specified for each in the for_each set.

The main differences between count and for_each are:

count works on a list and uses IDs that are whole numbers. for_each works with a map or set, and string keys are used as keys.

If you remove an item from the middle of your list using count, every item after it will move down to take its place, and Terraform will make them all over again. With for_each, each instance has a stable identity based on its key, and Terraform won't make new instances if you delete one.

for_each gives you more freedom and control, especially when you want to make resources with different traits, because you can map different resource options to values in each map or set.
