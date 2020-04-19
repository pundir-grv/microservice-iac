data "archive_file" "lambda_zip" {
    type          = "zip"
    source_dir    = "./lambda_scripts"
    output_path   = "./out/lambda_function.zip"
}

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

module "iam" {
  source = "./modules/iam"
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
  handler             = "kong_setup.main"
}

