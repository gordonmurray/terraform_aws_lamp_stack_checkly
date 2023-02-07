data "local_file" "browser_script" {
  filename = "./files/webserver-check.js"
}

resource "checkly_check" "php_check" {
  name                      = "Webserver PHP version check"
  type                      = "BROWSER"
  activated                 = true
  should_fail               = false
  frequency                 = 15
  double_check              = true
  use_global_alert_settings = true
  runtime_id                = "2022.02"

  locations = [
    "eu-west-1",
    "eu-west-2"
  ]

  tags = ["aws", "terraform", "browser"]

  script = data.local_file.browser_script.content
}
