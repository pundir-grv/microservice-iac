variable "engine" {
  default     = "postgres"
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  description = "Engine version"

  default = {
    mysql    = "5.7.21"
    postgres = "9.6.8"
  }
}

variable "db_name" {
  description = "db name"
}

variable "username" {
  description = "User name"
}

variable "password" {
  description = "password, provide through your ENV variables"
}

variable "sec_group_id" {
  description = "RDS security group id"
}

variable "subnet_group_id_1" {
  description = "RDS subnet group id"
}

variable "subnet_group_id_2" {
  description = "RDS subnet group id"
}

variable "public_access" {
  description = "Whether RDS is publically accessible or not"
}
