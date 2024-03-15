/*In this example, we are going to create two ingress rules for the aws_security_group. Both ingress rules are exactly the same apart from the port numbers .i.e. - 80 and 443. 
So if we do not use dynamic block then we need to create two ingress rules blocks inside the terraform file.*/

resource "aws_security_group" "main" {
   name   = "resource_without_dynamic_block"
   vpc_id = data.aws_vpc.main.id

   ingress {
      description = "ingress_rule_1"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
   }
   
   ingress {
      description = "ingress_rule_2"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
      Name = "AWS security group non-dynamic block"
   }
}
