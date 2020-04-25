resource "aws_ecs_service" "itachi_kong_service" {
  name                = var.cluster_name
  launch_type         = "FARGATE"
  cluster             = aws_ecs_cluster.itachi_kong_cluster.id
  task_definition     = aws_ecs_task_definition.itachi_kong_taskdef.arn
  desired_count       = var.ecs_service_desired_count

  load_balancer {
    target_group_arn  = var.target_group_id
    container_name    = var.cluster_name
    container_port    = var.kong_port_http
  }
  
  network_configuration {
    subnets             = var.subnet_ids
    assign_public_ip    = false
    security_groups     = var.security_group_ids
  }
}

resource "aws_ecs_service" "kong_dash" {
  name                = var.kong_dash_app_name
  launch_type         = "FARGATE"
  cluster             = aws_ecs_cluster.itachi_kong_cluster.id
  task_definition     = aws_ecs_task_definition.kong_dash.arn
  desired_count       = var.ecs_service_desired_count
  network_configuration {
    subnets             = var.subnet_ids
    assign_public_ip    = false
    security_groups     = var.security_group_ids
  }
}