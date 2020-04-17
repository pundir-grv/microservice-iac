resource "aws_vpc" "itachi_vpc" {
    cidr_block              = var.cidr_block_vpc
    instance_tenancy        = "default"
    enable_dns_hostnames    = true
    enable_dns_support      = true
    tags = {
        Name = "itachi_vpc"
    }
}
