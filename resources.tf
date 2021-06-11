# Validation Cert
resource "aws_acm_certificate" "sensoriumxr" {
  domain_name       = "sensoriumxr.com"
  validation_method = "DNS"
}








# Alarm to Cloud Watch
resource "aws_cloudwatch_metric_alarm" "sensoriumxr-cert-alarm" {
  alarm_name                = "terraform-test-alarm-cert"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "alarm-cert"
  namespace                 = "AWS/ACM"
  period                    = "3600"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "expired cert alarm "
  insufficient_data_actions = []
}
