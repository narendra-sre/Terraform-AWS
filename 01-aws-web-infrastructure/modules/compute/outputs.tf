output "instance_id" {
  description = "ID of web server"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP address of web server"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "Public DNS of web server"
  value       = aws_instance.web.public_dns
}