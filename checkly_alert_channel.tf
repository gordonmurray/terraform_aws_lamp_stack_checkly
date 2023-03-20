# An Email alert channel
resource "checkly_alert_channel" "email_alert" {
  email {
    address = var.email_address
  }
  send_recovery = true
  send_failure  = true
  send_degraded = false

}