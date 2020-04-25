resource "aws_ecs_task_definition" "itachi_kong_taskdef" {
  family                    = var.cluster_name
  task_role_arn             = var.iam_role
  network_mode              = "awsvpc"
  requires_compatibilities  = ["FARGATE"]
  execution_role_arn        = var.execution_role_arn 
  cpu                       = var.cpu
  memory                    = var.memory
  container_definitions     = <<EOF
[
  {
    "name": "${var.cluster_name}",
    "container_name": "${var.cluster_name}",
    "image": "${var.container_image}",
    "memoryReservation": ${var.container_memory_reservation},
    "portMappings": [
      {
        "ContainerPort": ${var.kong_port_http},
        "Protocol": "tcp"
      },
      {
        "ContainerPort": ${var.kong_port_https},
        "Protocol": "tcp"
      },
      {
        "ContainerPort": ${var.kong_port_admin},
        "Protocol": "tcp"
      }
    ],
    "environment": [
      {
        "name"  : "KONG_ADMIN_LISTEN",
        "value" : "0.0.0.0:${var.kong_port_admin}"
      },
      {
        "name"  : "DB_USERNAME",
        "value" : "${var.db_username}"
      },
      {
        "name"  : "DB_PASSWORD",
        "value" : "${var.db_password}"
      },
      {
        "name"  : "DB_ENGINE",
        "value" : "${var.db_engine}"
      },
      {
        "name"  : "DB_HOST",
        "value" : "${var.db_host}"
      }
    ]
  }
]
EOF
}

resource "aws_ecs_task_definition" "kong_dash" {
  family                    = var.kong_dash_app_name
  network_mode              = "awsvpc"
  requires_compatibilities  = ["FARGATE"]
  execution_role_arn        = var.execution_role_arn 
  cpu                       = var.cpu
  memory                    = var.memory
  container_definitions     = <<EOF
[
  {
    "name"              : "${var.kong_dash_app_name}",
    "container_name"    : "${var.kong_dash_app_name}",
    "image"             : "${var.container_image}",
    "memoryReservation" : ${var.container_memory_reservation},
    "command"           : [
      "start",
      "--kong-url",
      "${var.kong_admin_api_service_url}"
    ],
    "portMappings": [
      {
        "ContainerPort" : ${var.kong_dash_port_http},
        "Protocol"      : "tcp"
      }
    ]
  }
]
EOF
}