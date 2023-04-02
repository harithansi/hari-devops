module "aws_alb_module" {
  source            = "./modules/alb"
  vpc_id            = var.vpc_id
  tg_name           = var.tg_name
  subnet_ids_public = var.subnet_ids_public
  alb_name          = var.alb_name
  alb_sg            = var.alb_sg
  health_check_path = var.health_check_path
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn
}

module "autoscaling_group" {
  depends_on                               = [module.aws_alb_module]
  source                                   = "./modules/auto_scaling"
  asg_name                                 = var.asg_name
  max_size                                 = var.max_size
  min_size                                 = var.min_size
  desired_capacity                         = var.desired_capacity
  key_name                                 = var.key_name
  ami_id                                   = var.ami_id
  instance_sg                              = var.instance_sg
  instance_type                            = var.instance_type
  instance_types                           = var.instance_types
  on_demand_base_capacity                  = var.on_demand_base_capacity
  on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
  subnet_ids_private                       = var.subnet_ids_private
  instance_profile_arn                     = var.instance_profile_arn
  target_group_arn                         = module.aws_alb_module.alb_tg_arn
  health_check_grace_period                = var.health_check_grace_period
  default_cooldown                         = var.default_cooldown
  # ...
}


/*module "rds_instance" {
  source                    = "./modules/rds_instance"
  allocated_storage         = var.allocated_storage
  snapshot_identifier       = var.snapshot_identifier
  storage_type              = var.storage_type
  engine                    = var.engine
  engine_version            = var.engine_version
  instance_class            = var.instance_class
  identifier                = var.identifier
  vpc_security_group_ids    = var.vpc_security_group_ids
  db_subnet_group_name      = var.db_subnet_group_name
  publicly_accessible       = var.publicly_accessible
  skip_final_snapshot       = var.skip_final_snapshot
  port                      = var.port
  final_snapshot_identifier = var.final_snapshot_identifier
}*/