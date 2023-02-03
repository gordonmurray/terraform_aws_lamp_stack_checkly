resource "aws_security_group" "webserver" {
  name        = "webserver"
  description = "webserver security group"
  vpc_id      = aws_vpc.vpc.id
}