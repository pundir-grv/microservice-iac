
variable "function_name" {
  description = "Name of lambda function"
}

variable "role" {
  description = "IAM role for Lambda"
}

variable "handler" {
  description = "entry point for lambda function"
}

variable "s3_bucket" {}
variable "s3_key" {}
variable "s3_object_version" {}
variable "security_group_ids" {
  description = "security group for lambda"
}
variable "subnet_ids" {
  description = "subnet ids for lambda"
}

variable "timeout" {
  description = "timeout for lambda"
}

variable "memory_size" {
  description = "mem size"
}












