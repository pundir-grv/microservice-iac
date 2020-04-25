resource "aws_ecs_cluster" "itachi_kong_cluster" {
  name = var.cluster_name
  capacity_providers  = ["FARGATE"]
  tags = {
      Name = var.cluster_name
  }
}