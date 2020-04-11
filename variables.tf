variable "cidr_block_vpc" {
  default = "192.168.0.0/16"
}

variable "cidr_block_public" {
  default = "192.168.1.0/24"
}

variable "cidr_block_private" {
  default = "192.168.2.0/24"
}

variable "availability_zone" {
  default = "ap-south-1a"
}
