resource "aws_ecs_cluster" "itachi_kong_cluster" {
  name = var.cluster_name
  tags = {
      Name = var.cluster_name
  }
}