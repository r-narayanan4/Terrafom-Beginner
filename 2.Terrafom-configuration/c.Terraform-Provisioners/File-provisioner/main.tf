# AWS Provider Configuration
provider "aws" {
    region     = "ap-south-2"                  # AWS region to operate in
    access_key = "your-access-key"        # Access key to authenticate Terraform with AWS
    secret_key = "your-secret-key" # Secret key to authenticate Terraform with AWS
} 

# AWS Instance Resource
resource "aws_instance" "ec2_example" {
    ami                    = "ami-0183d80552093ddaf"    # ID of the Amazon Machine Image (AMI) to use for the instance
    instance_type          = "t3.micro"                  # Instance type for the EC2 instance
    key_name               = "aws_rln_key"                   # Name of the key pair to use for SSH authentication
    vpc_security_group_ids = [aws_security_group.main.id]  # Security group for the EC2 instance
    tags = {
        Name = "Terraform EC2"
    }


    # Provisioner for file transfer
    provisioner "file" {
        source      = "rln.txt" # Source file path
        destination = "/home/ubuntu/rln.txt"                  # Destination file path on the remote machine
    }

    # Connection settings for SSH
    connection {
        type        = "ssh"                                        # Type of connection (SSH)
        host        = self.public_ip                               # Public IP address of the instance
        user        = "ubuntu"                                     # SSH user for authentication
        private_key = "${file("aws_rln_key")}"  # Path to the private key file for SSH authentication
        timeout     = "4m"                                         # Connection timeout
    }
}

# AWS Security Group Resource
resource "aws_security_group" "main" {
    egress = [
        {
        cidr_blocks      = [ "0.0.0.0/0", ]
        description      = ""
        from_port        = 0
        ipv6_cidr_blocks = []
        prefix_list_ids  = []
        protocol         = "-1"
        security_groups  = []
        self             = false
        to_port          = 0
    }
    ]
    ingress                = [
    {
        cidr_blocks      = [ "0.0.0.0/0", ]
        description      = ""
        from_port        = 22
        ipv6_cidr_blocks = []
        prefix_list_ids  = []
        protocol         = "tcp"
        security_groups  = []
        self             = false
        to_port          = 22
    }
    ]
}

# AWS Key Pair Resource
resource "aws_key_pair" "deployer" {
    key_name   = "aws_rln_key"                                                                                           # Name of the key pair
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMYPQctEs7fAyiPVXziafWQfOXE53uTff1luBdOJxjuUoIARrKtXpKb4v9p/H8BB062KxU5O+JSKPmQe4cjA2pP96+7v62K01PW136BUCfosLel5GJc9oRf8iAaqwlPLDQ3Oo9yGaoG2Pv+q6lWfcN74nL25Sxxi0TNGx1kspk5i+JAMDv98GT7uWOWAfepencRp8fdDBxrfgwBsxbDWdKCp8ycckjzKyJw+tkfUetrib0cmCTrMXgF3xK2F793zig8ASJH+RTNCnl/hMDkiYjLnD5mvJDQ+gl57d2X+65XKzTsryGWf2ndBhZzuIjz1kKJQYMGMZhhLghbjjhEYGv RLnar@hp"
}
