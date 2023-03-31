output "alb_tg_arn" {
  value = module.aws_alb_module.alb_tg_arn
}

output "rds_endpoint" {
  value = module.rds_instance.rds_endpoint
}