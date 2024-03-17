#maint.tf 

resource "aws_instance" "example" {
  ami = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  
  # user_data attribute - Create a txt file inside EC2 instance
  user_data     = <<-EOF
                    #!/bin/bash
                    echo "Hello, World!" > hello.txt
                  EOF
} 
