output "redis_endpoint" {
  value = aws_elasticache_replication_group.kong_redis.primary_endpoint_address
}
