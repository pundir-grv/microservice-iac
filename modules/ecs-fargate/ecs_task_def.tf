resource "aws_ecs_task_definition" "itachi_kong_taskdef" {
  family                = var.cluster_name
  task_role_arn         = var.iam_role
  network_mode          = "awsvpc"
  container_definitions = <<EOF
[
  {
    "name": "${var.cluster_name}"",
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