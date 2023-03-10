terraform {

  required_version = "1.3.7"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "4.53.0"

    }

    checkly = {
      source  = "checkly/checkly"
      version = "1.6.3"
    }

  }

}

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "gordonmurray"

  default_tags {
    tags = {
      App = "terraform_aws_lamp_stack_checkly"
    }
  }

}

provider "checkly" {
  api_key    = var.checkly_api_key
  account_id = var.checkly_account_id
}