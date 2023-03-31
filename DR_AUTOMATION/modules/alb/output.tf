output "alb_arn" {
  value = aws_alb.main.arn
}
output "alb_hostname" {
  value = aws_alb.main.dns_name
}
output "alb_listner" {
  value = aws_alb_listener.alb_listener
}

output "alb_target_group" {
  value = aws_alb_target_group.alb_tg.id
}

output "alb_tg_arn" {
  value = aws_alb_target_group.alb_tg.arn
}

