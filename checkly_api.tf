resource "checkly_check" "webserver_check" {
  name                      = "Webserver check"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 15
  double_check              = true
  use_global_alert_settings = true

  locations = [
    "eu-west-1",
    "eu-west-2"
  ]

  tags = ["aws", "terraform"]

  request {
    url              = "http://${aws_instance.webserver.public_dns}"
    follow_redirects = true
    body_type        = "JSON"
    method           = "GET"

    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }
  }
}

resource "checkly_check" "sendgrid_check" {
  name                      = "Sendgrid Incident check"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 15
  double_check              = true
  use_global_alert_settings = true

  locations = [
    "eu-west-1",
    "eu-west-2"
  ]

  tags = ["aws", "terraform", "sendgrid"]

  request {
    url              = "https://status.sendgrid.com/api/v2/summary.json"
    follow_redirects = true
    body_type        = "JSON"
    method           = "GET"

    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }

    assertion {
      source     = "JSON_BODY"
      property   = "$.incidents"
      comparison = "IS_EMPTY"
      target     = ""
    }
  }
}

resource "checkly_check" "stripe_check" {
  name                      = "Stripe Products check"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 15
  double_check              = true
  use_global_alert_settings = true

  locations = [
    "eu-west-1",
    "eu-west-2"
  ]

  tags = ["aws", "terraform", "stripe"]

  request {
    url              = "https://api.stripe.com/v1/products"
    follow_redirects = true
    body_type        = "JSON"
    method           = "GET"

    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }

    basic_auth {
      username = var.stripe_api_key
      password = "x"
    }
  }
}