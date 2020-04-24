data "archive_file" "lambda_zip" {
    type              = "zip"
    source_dir        = "./lambda_scripts"
    output_path       = "./out/lambda_function.zip"
}

module "vpc" {
  source              = "./modules/network"
  cidr_block_vpc      = var.cidr_block_vpc
  cidr_block_public_a = var.cidr_block_public_a
  cidr_block_public_b = var.cidr_block_public_b
  cidr_block_public_c = var.cidr_block_public_c
  cidr_block_public_d = var.cidr_block_public_d
  availability_zone_a = var.availability_zone_a
  availability_zone_b = var.availability_zone_b
}

module "secrets" {
  source              = "./modules/secrets_manager"
  rds_username        = var.rds_username
  rds_password        = var.rds_password  
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
  subnet_group_id_1   = module.vpc.subnet_id_private_a
  subnet_group_id_2   = module.vpc.subnet_id_private_b
}

module "iam" {
  source              = "./modules/iam"
}

module "s3" {
  source              = "./modules/s3"
  bucket_name         = var.bucket_name
  s3_file_key         = var.s3_file_key
  zip_file_path       = "./out/lambda_function.zip"
}


module "lambda" {
  source              = "./modules/lambda"
  s3_bucket           = module.s3.s3_bucket
  s3_key              = module.s3.s3_key
  s3_object_version   = module.s3.s3_object_version
  function_name       = var.function_name
  role                = module.iam.iam_role_lambda
  timeout             = 40
  memory_size         = 512
  security_group_ids  = module.vpc.security_group_id
  subnet_ids          = [module.vpc.subnet_id_private_a,module.vpc.subnet_id_private_b]
  handler             = "kong_setup.main"
}

module "ec2" {
  source              = "./modules/ec2"
  availability_zone_a = var.availability_zone_a
  security_groups     = [module.vpc.security_group_id]
  subnet_id_c         = module.vpc.subnet_id_pub_c 
  instance_name       = "Jump Host"
  key_name            = "deployer-key"
}

# module "ec2_private_host" {
#   source              = "./modules/ec2"
#   availability_zone_a = var.availability_zone_a
#   security_groups     = [module.vpc.security_group_id]
#   subnet_id_c         = module.vpc.subnet_id_private_a 
#   instance_name       = "Private Host"
#   key_name            = "deployer-key2"
# }
module "redis" {
  source              = "./modules/redis"
  redis_grp_id        = var.redis_grp_id
  availability_zones  = [var.availability_zone_a]
  subnet_ids          = [module.vpc.subnet_id_private_a]
  security_group_ids  = [module.vpc.security_group_id]
}

module "kong_alb" {
  source              = "./modules/loadBalancers"
  subnet_ids          = [module.vpc.subnet_id_pub_c,module.vpc.subnet_id_pub_d]
  security_grp_ids    = [module.vpc.security_group_id]
  vpc_id              = module.vpc.vpc_id
  cluster_name        = var.cluster_name
}
