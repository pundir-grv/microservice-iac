resource "aws_ecs_service" "itachi_kong_service" {
  name                = var.cluster_name
  launch_type         = "FARGATE"
  cluster             = aws_ecs_cluster.itachi_kong_cluster.id
  task_definition     = aws_ecs_task_definition.itachi_kong_taskdef.arn
  desired_count       = var.ecs_service_desired_count
  scheduling_strategy = "DAEMON"

  load_balancer {
    target_group_arn  = aws_alb_target_group.main.id
    container_name    = var.cluster_name
    container_port    = var.kong_port_http
  }
  
  network_configuration {
    subnets             = var.subnet_ids
    assign_public_ip    = false
    security_groups     = var.security_group_ids
  }
  depends_on = [
    "aws_alb.main"
  ]
}