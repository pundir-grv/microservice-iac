variable "node_type" {
  default = "cache.t2.micro"
}
variable "node_count" {
  default = 1
}
variable "redis_grp_id" {
  description = "unique cluster id"
}
variable "availability_zones" {
  type = list
  description = "availability zones"
}
variable "redis_port" {
  default = 6379
}
variable "engine_version" {
  default = "5.0.6"
}
variable "subnet_ids" {
  type = list
}
variable "security_group_ids" {
  type = list
}


