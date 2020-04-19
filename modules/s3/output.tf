output "s3_bucket" {
  value = aws_s3_bucket_object.file_upload.bucket
}

output "s3_key" {
  value = aws_s3_bucket_object.file_upload.key
}

output "s3_object_version" {
  value = aws_s3_bucket_object.file_upload.version_id
}