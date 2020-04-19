resource "aws_lambda_function" "rds_lambda" {
  s3_bucket           = var.s3_bucket
  s3_key              = var.s3_key
  s3_object_version   = var.s3_object_version
  function_name       = var.function_name
  role                = var.role
  handler             = var.handler
  runtime             = "python3.7"
}