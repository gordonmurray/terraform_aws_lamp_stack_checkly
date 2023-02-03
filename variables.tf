variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "ami_id" {
  type    = string
  default =  "ami-03d568a0c334477dd" # Ubuntu 22.04 ARM
}

variable "subnet_id" {
  type    = string
}

variable "my_ip_address" {
  type        = string
  description = "Your current IP address so you can SSH in to instances"
}

variable "checkly_api_key" {
  type        = string
  description = "Checkly API key in the format of cu_xxxxx"
}

variable "checkly_account_id" {
  type = string
}

variable "private_location_key" {
  type        = string
  description = "A key for a Checkly Private Location in the format of pl_xxxxxx"
}