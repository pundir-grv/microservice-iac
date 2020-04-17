variable "cidr_block_vpc" {
  default = "192.168.0.0/16"
}

variable "cidr_block_public_a" {
  default = "192.168.3.0/24"
}

variable "cidr_block_public_b" {
  default = "192.168.2.0/24"
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
    postgres = "9.6.8"
  }
}

variable "db_name" {
  default = "kongdb"
}

variable "public_access" {
  default = true
}
