 resource "aws_db_instance" "database" {
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
  lifecycle {
    prevent_destroy = false
  } 
} 