resource "checkly_environment_variable" "webserver" {
  key   = "WEBSERVER_URL"
  value = aws_instance.webserver.public_dns
}