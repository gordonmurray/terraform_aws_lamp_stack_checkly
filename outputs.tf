output "webserver" {
  description = "The Webserver EC2 instance"
  value       = aws_instance.webserver.public_dns
}
