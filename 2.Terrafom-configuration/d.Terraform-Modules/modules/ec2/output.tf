# Output for instance Public ip
output "public_ip" {
  value = aws_instance.example.id
}