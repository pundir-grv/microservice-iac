module "vpc" {
  source                    = "./modules/network"
  cidr_block_vpc            = var.cidr_block_vpc
  cidr_block_public_a       = var.cidr_block_public_a
  cidr_block_public_b       = var.cidr_block_public_b
  availability_zone_a       = var.availability_zone_a
  availability_zone_b       = var.availability_zone_b
}

module "secrets" {
  source          = "./modules/secrets_manager"
  rds_username    = var.rds_username
  rds_password    = var.rds_password  
}

module "rds" {
  source              = "./modules/rds"
  engine              = var.engine
  engine_version      = var.engine_version
  db_name             = var.db_name
  username            = module.secrets.rds_creds["username"]
  password            = module.secrets.rds_creds["password"]
  public_access       = var.public_access
  sec_group_id        = module.vpc.security_group_id
  subnet_group_id_1   = module.vpc.subnet_id_a
  subnet_group_id_2   = module.vpc.subnet_id_b
}
