#main.tf 
resource "aws_instance" "example" {
  ami = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name= "aws_key"
  user_data     =  "${file("install_apache.sh")}"
}
