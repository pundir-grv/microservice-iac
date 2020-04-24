output "iam_role_lambda" {
  value = aws_iam_role.iam_for_lambda_tf.arn
}
output "iam_role_ecs" {
  value = aws_iam_role.ecs_task.arn
}
