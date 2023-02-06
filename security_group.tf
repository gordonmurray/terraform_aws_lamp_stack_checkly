resource "aws_security_group" "webserver" {
  name        = "webserver"
  description = "webserver security group"
  vpc_id      = var.vpc_id
}