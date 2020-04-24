
output "alb_dns_name" {
  value = "${aws_alb.itachi_kong_alb.dns_name}"
}
output "alb_zone_id" {
  value = "${aws_alb.itachi_kong_alb.zone_id}"
}