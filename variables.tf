variable "cidr_block_vpc" {
  default = "192.168.0.0/16"
}

variable "cidr_block_public_a" {
  default = "192.168.3.0/24"
}

variable "cidr_block_public_b" {
  default = "192.168.2.0/24"
}

variable "cidr_block_public_c" {
  default = "192.168.4.0/24"
}

variable "cidr_block_public_d" {
  default = "192.168.5.0/24"
}

variable "availability_zone_a" {
  default = "ap-south-1a"
}

variable "availability_zone_b" {
  default = "ap-south-1b"
}

variable "rds_password" {}

variable "rds_username" {
  default = "akatsuki"
}

variable "engine" {
  default     = "postgres"
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  description = "Engine version"

  default = {
    mysql    = "5.7.21"
    postgres = "9.6.11"
  }
}

variable "db_name" {
  default = "kongdb"
}

variable "public_access" {
  default = false
}

variable "function_name" {
  default = "kong_rds_init_setup"
}

variable "s3_file_key" {
  default = "rds_lambda_setup.zip"
}

variable "bucket_name" {
  default = "itachi-lambda-functions"
}

variable "redis_grp_id" {
  default = "kong-itachi-redis-test"
}

variable "cluster_name" {
  default = "itachi-kong"
}
variable "kong_port_http" {
  default = 8080
}
variable "kong_port_https" {
  default = 8443
}
variable "kong_port_admin" {
  default = 8112
}
variable "kong_dash_port_http" {
  default = 8081
}
variable "kong_dash_app_name" {
  default = "itach-kong-dashboard"
}




