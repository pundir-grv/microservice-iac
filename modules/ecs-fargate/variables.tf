variable "cluster_name" {
  description = "ECS cluster name"
}
variable "iam_role" {}
variable "container_image" {}
variable "container_memory_reservation" {
  default = 256
}
variable "kong_port_http" {}
variable "kong_port_https" {}
variable "kong_port_admin" {}
variable "db_username" {}
variable "db_password" {}
variable "db_engine" {}
variable "db_host" {}
variable "kong_dash_app_name" {}
variable "kong_admin_api_service_url" {}
variable "kong_dash_port_http" {}
variable "ecs_service_desired_count" {
  default = 1
}
variable "target_group_id" {}
variable "subnet_ids" {
  type = list
}
variable "security_group_ids" {
  type = list
}
variable "cpu" {
  default = 512
}
variable "memory" {
  default = 1024
}
variable "execution_role_arn" {}












