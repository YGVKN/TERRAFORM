# Validation Cert
resource "aws_acm_certificate" "sensoriumxr" {
  domain_name       = "sensoriumxr.com"
  validation_method = "DNS"
}


# Alarm to Cloud Watch
resource "aws_cloudwatch_metric_alarm" "Cert-alarm" {
  alarm_name          = "Cert-alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/ACM"
  period              = "3600"
  statistic           = "Average"
  threshold           = "100"
  alarm_description   = "CErt alarm"
  actions_enabled     = "true"
  alarm_actions       = ["arn:aws:sns:${var.region}:${var.account_id}:${var.sns_topic_name}"]
  ok_actions          = ["arn:aws:sns:${var.region}:${var.account_id}:${var.sns_topic_name}"]
}
