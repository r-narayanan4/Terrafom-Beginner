# output.tf

output "instance_ip" {
    value = aws_instance.ec2_example.public_ip
}
