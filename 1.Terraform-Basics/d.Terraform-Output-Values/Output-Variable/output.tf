# output.tf

output "instance_ip" {
    value = aws_instance.ec2_example.public_ip
    #sensitive = true # we are using sensitive = true which tells terraform not to show public ip on console.
}
