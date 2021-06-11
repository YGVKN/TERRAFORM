variable "profile" {
  type        = string
  default     = "devops"
  description = "profile name"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "list of a region name"
}

variable "sns_topic_name" {
  type        = string
  default     = "certs-notify-to-slack"
  description = "name of a sns topic"
}

variable "account_id" {
  type        = string
  default     = "$TF_VAR_account_id"
  description = "env variable"
}

variable "environment" {
  type        = string
  default     = "sensoriumXR"
  description = "env company"
}
