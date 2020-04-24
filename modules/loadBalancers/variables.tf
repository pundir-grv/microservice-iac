variable "cluster_name" {
  description = "cluster name"
}
variable "subnet_ids" {
  description = "subnet ids"
  type = list
}

variable "security_grp_ids" {
  type = list
}

variable "vpc_id" {
  description = "VPC"
}



