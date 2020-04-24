resource "aws_elasticache_replication_group" "kong_redis" {
  automatic_failover_enabled    = false
  availability_zones            = var.availability_zones
  replication_group_id          = var.redis_grp_id
  replication_group_description = "Redis Cluster for kong Setup"
  node_type                     = var.node_type
  number_cache_clusters         = var.node_count
  port                          = var.redis_port
  engine_version                = var.engine_version
  security_group_ids            = var.security_group_ids
  apply_immediately             = true
  parameter_group_name          = aws_elasticache_parameter_group.kong_redis_parameter_grp.id
  subnet_group_name             = aws_elasticache_subnet_group.kong_redis_subnet_grp.id
  tags = {
      Name = var.redis_grp_id
  }
  depends_on = [
      aws_elasticache_subnet_group.kong_redis_subnet_grp,
      aws_elasticache_parameter_group.kong_redis_parameter_grp
  ]
}

resource "aws_elasticache_subnet_group" "kong_redis_subnet_grp" {
  name                          = "${var.redis_grp_id}-subnet-grp"
  subnet_ids                    = var.subnet_ids
}

resource "aws_elasticache_parameter_group" "kong_redis_parameter_grp" {
  name                          = "${var.redis_grp_id}-parameter-grp"
  family                        = "redis${replace(var.engine_version,"/\\.[\\d]+$/","")}"
  parameter {
    name                        = "activerehashing"
    value                       = "yes"
  }
}

resource "aws_ssm_parameter" "redisEndpoint" {
  name        = "/redis/redisEndpoint"
  description = "url of the redis host"
  type        = "String"
  value       = aws_elasticache_replication_group.kong_redis.primary_endpoint_address
  depends_on  = [aws_elasticache_replication_group.kong_redis]
}
