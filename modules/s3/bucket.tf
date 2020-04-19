resource "aws_s3_bucket" "itachi_lambda_functions" {
  bucket = var.bucket_name
  acl = "private"
  versioning {
    enabled = true
  }

  tags = {
    Name = "itachi_lambda_functions"
  }

}

resource "aws_s3_bucket_object" "file_upload" {
  bucket = aws_s3_bucket.itachi_lambda_functions.id
  key    = var.s3_file_key
  source = var.zip_file_path
  etag   = filemd5(var.zip_file_path)
}