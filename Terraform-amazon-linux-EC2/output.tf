output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.default_instance.public_ip
}
output "instance_id" {
  value = aws_instance.default_instance.id
}

output "instance_public_dns" {
  value = aws_instance.default_instance.public_dns
}