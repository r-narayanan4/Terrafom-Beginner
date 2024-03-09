# terraform.tfvars

# Variable values for AWS configuration
aws_region      = "ap-south-2" # Specify your AWS region
aws_access_key  = "your-access-key" # Specify your AWS access key
aws_secret_key  = "your-secret-key" # Specify your AWS secret key

# Variable values for EC2 instance configuration
tag   = "Terraform-EC2" # Specify tags for the EC2 instance
ami_id          = "ami-0183d80552093ddaf" # Specify the AMI ID for the EC2 instance
instance_type   = "t3.micro" # Specify the instance type for the EC2 instance
