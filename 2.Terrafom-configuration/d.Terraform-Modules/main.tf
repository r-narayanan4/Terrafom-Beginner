module "my_ec2" {
    source    	= "./modules/ec2"
    ami       	= "ami-0183d80552093ddaf"
    instance_type = "t3.micro"
    name      	= "my-ec2-instance"
}

output "ec2_public_ip" {
  value = module.my_ec2.public_ip
}