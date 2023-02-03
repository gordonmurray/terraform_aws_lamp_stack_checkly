# Prepare user_data for the webserver
data "template_file" "webserver_user_data" {
  template = file("files/webserver.tpl")
}

# Create an EC2 instance to use as a Webserver
resource "aws_instance" "webserver" {
  ami                    = var.ami_id
  instance_type          = "t4g.nano"
  key_name               = aws_key_pair.pem-key.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.webserver.id]

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = "10"
  }

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  tags = {
    Name = "LAMP stack Webserver"
  }

  user_data = data.template_file.webserver_user_data.rendered

}
