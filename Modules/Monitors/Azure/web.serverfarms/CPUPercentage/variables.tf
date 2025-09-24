variable "evaluation_delay" {
  type    = number
  default = 300
}

variable "group_retention_duration" {
  type    = string
  default = "1d"
}

variable "new_group_delay" {
  type    = number
  default = 30
}

variable "notify_audit" {
  type    = bool
  default = true
}

variable "notify_by" {
  type    = list(string)
  default = ["name", "instance"]
}

variable "on_missing_data" {
  type    = string
  default = "default"
}

variable "critical_threshold" {
  type    = number
  default = 90
}

variable "critical_recovery" {
  type    = number
  default = 80
}

variable "warning_threshold" {
  type    = number
  default = 80
}

variable "warning_recovery" {
  type    = number
  default = 75
}

variable "name" {
  type    = string
  default = "[] Azure App Service Plan - CPU Percetage"
}

variable "type" {
  type    = string
  default = "query alert"
}

variable "tags" {
  type    = list(string)
  default = [
    ""
  ]
}

variable "priority" {
  type    = number
  default = 3
}

variable "query" {
  type    = string
  default = "max(last_1h):sum:azure.web_serverfarms.cpu_percentage by {name,instance,dd_resource_key,resource_group,kind,plan_size,plan_tier,region,subscription_name}.weighted() > 90"
}

variable "message" {
  type    = string
  default = "to do1234"
}
