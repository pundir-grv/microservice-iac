
output "alb_dns_name" {
  value = aws_alb.itachi_kong_alb.dns_name
}
output "alb_zone_id" {
  value = aws_alb.itachi_kong_alb.zone_id
}
output "target_group_id" {
  value = aws_alb_target_group.itachi_kong_tg.id
}
