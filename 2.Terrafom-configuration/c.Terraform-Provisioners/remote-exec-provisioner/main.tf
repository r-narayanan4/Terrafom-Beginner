# AWS Provider Configuration
provider "aws" {
    region     = "ap-south-2"                                       # AWS region to operate in
    access_key = "your-access-key"                             # Access key to authenticate Terraform with AWS
    secret_key = "your-secret-key"          # Secret key to authenticate Terraform with AWS
} 

# AWS Instance Resource
resource "aws_instance" "ec2_example" {
    ami                    = "ami-0183d80552093ddaf"                 # ID of the Amazon Machine Image (AMI) to use for the instance
    instance_type          = "t3.micro"                               # Instance type for the EC2 instance
    key_name               = "aws_rln_key"                            # Name of the key pair to use for SSH authentication
    vpc_security_group_ids = [aws_security_group.main.id]             # Security group for the EC2 instance
    tags = {
        Name = "Terraform EC2"                                      # Tag for identifying the instance
    }

    # Provisioner for remote execution
    provisioner "remote-exec" {
        inline = [
            "touch hello.txt",                                       # Create a new file named hello.txt
            "echo 'helloworld remote provisioner' >> hello.txt",     # Append a message to the hello.txt file
        ]
    }

    # Connection settings for SSH
    connection {
        type        = "ssh"                                           # Type of connection (SSH)
        host        = self.public_ip                                  # Public IP address of the instance
        user        = "ubuntu"                                        # SSH user for authentication
        private_key = "${file("aws_rln_key")}"                        # Path to the private key file for SSH authentication
        timeout     = "4m"                                            # Connection timeout
    }
}

# AWS Security Group Resource
resource "aws_security_group" "main" {
    egress = [
        {
            cidr_blocks      = [ "0.0.0.0/0" ]                        # CIDR blocks for egress traffic
            description      = ""                                     # Description for egress traffic
            from_port        = 0                                      # Starting port for egress traffic
            ipv6_cidr_blocks = []                                     # IPv6 CIDR blocks for egress traffic
            prefix_list_ids  = []                                     # Prefix list IDs for egress traffic
            protocol         = "-1"                                   # Protocol for egress traffic (-1 means all protocols)
            security_groups  = []                                     # Security groups for egress traffic
            self             = false                                  # Whether the security group itself is allowed for egress traffic
            to_port          = 0                                      # Ending port for egress traffic
        }
    ]
    ingress = [
        {
            cidr_blocks      = [ "0.0.0.0/0" ]                        # CIDR blocks for ingress traffic
            description      = ""                                     # Description for ingress traffic
            from_port        = 22                                     # Starting port for ingress traffic (SSH)
            ipv6_cidr_blocks = []                                     # IPv6 CIDR blocks for ingress traffic
            prefix_list_ids  = []                                     # Prefix list IDs for ingress traffic
            protocol         = "tcp"                                  # Protocol for ingress traffic (TCP)
            security_groups  = []                                     # Security groups for ingress traffic
            self             = false                                  # Whether the security group itself is allowed for ingress traffic
            to_port          = 22                                     # Ending port for ingress traffic (SSH)
        }
    ]
}

# AWS Key Pair Resource
resource "aws_key_pair" "deployer" {
    key_name   = "aws_rln_key"                                       # Name of the key pair
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMYPQctEs7fAyiPVXziafWQfOXE53uTff1luBdOJxjuUoIARrKtXpKb4v9p/H8BB062KxU5O+JSKPmQe4cjA2pP96+7v62K01PW136BUCfosLel5GJc9oRf8iAaqwlPLDQ3Oo9yGaoG2Pv+q6lWfcN74nL25Sxxi0TNGx1kspk5i+JAMDv98GT7uWOWAfepencRp8fdDBxrfgwBsxbDWdKCp8ycckjzKyJw+tkfUetrib0cmCTrMXgF3xK2F793zig8ASJH+RTNCnl/hMDkiYjLnD5mvJDQ+gl57d2X+65XKzTsryGWf2ndBhZzuIjz1kKJQYMGMZhhLghbjjhEYGv RLnar@hp" # Public key for the key pair
}
