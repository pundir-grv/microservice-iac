module "vpc" {
  source                    = "./modules/network"
  cidr_block_vpc            = var.cidr_block_vpc
  cidr_block_public         = var.cidr_block_public
  availability_zone         = var.availability_zone
}
