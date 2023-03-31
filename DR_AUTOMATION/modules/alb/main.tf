resource "aws_alb" "main" {
  name            = var.alb_name
  #vpc_id = var.vpc_id
  subnets         = var.subnet_ids_public
  security_groups = [var.alb_sg]
}


resource "aws_alb_target_group" "alb_tg" {
  name        = var.tg_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
  #deregistration_delay = var.deregistration_delay
  deregistration_delay = 60

  health_check {
    healthy_threshold   = "5"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "5"
    path                = var.health_check_path
    unhealthy_threshold = "5"
  }
}


resource "aws_alb_listener" "alb_listener" {
  #load_balancer_arn = var.aws_alb_arn
  load_balancer_arn = aws_alb.main.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.alb_tg.id
    type             = "forward"
  }
  depends_on = [aws_alb_target_group.alb_tg]
}

resource "aws_alb_listener" "ssl_listener" {
  load_balancer_arn = aws_alb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = var.ssl_policy
  depends_on        = [aws_alb_target_group.alb_tg]
  certificate_arn   = var.certificate_arn

  default_action {
    target_group_arn = aws_alb_target_group.alb_tg.id
    type             = "forward"
  }
}