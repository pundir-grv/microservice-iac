resource "aws_alb" "itachi_kong_alb" {
  name              = "${var.cluster_name}-ALB"
  subnets           = var.subnet_ids
  security_groups   = var.security_grp_ids
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.itachi_kong_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn  = aws_alb_target_group.itachi_kong_tg.arn
    type              = "forward"
  }
}
resource "aws_alb_target_group" "itachi_kong_tg" {
  name              = "${var.cluster_name}-TG-HTTP"
  port              = 80
  protocol          = "HTTP"
  vpc_id            = var.vpc_id
  target_type       = "ip"
  stickiness {
    type            = "lb_cookie"
  }
  health_check {
    path            = "/"
    matcher         = "200,404"
  }
}