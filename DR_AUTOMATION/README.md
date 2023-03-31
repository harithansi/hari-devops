## Requirements



## Providers

AWS

## Consideration

This modules assumes that you have already created the necessary VPC, subnet group, and security group for the RDS instance,ALB,ASG.

Ensure that you have the necessary permissions to create an RDS instance in the specified VPC and security group.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_autoscaling_group"></a> [autoscaling\_group](#module\_autoscaling\_group) | ./modules/auto_scaling | n/a |
| <a name="module_aws_alb_module"></a> [aws\_alb\_module](#module\_aws\_alb\_module) | ./modules/alb | n/a |
| <a name="module_rds_instance"></a> [rds\_instance](#module\_rds\_instance) | ./modules/rds_instance | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | Name of Alb | `string` | n/a | yes |
| <a name="input_alb_sg"></a> [alb\_sg](#input\_alb\_sg) | ALB security group ID | `string` | n/a | yes |
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | storage size | `number` | n/a | yes |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID of the instance | `string` | n/a | yes |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | Name of the Auto Scaling Group | `string` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | n/a | `string` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | DB subnet name | `string` | n/a | yes |
| <a name="input_default_cooldown"></a> [default\_cooldown](#input\_default\_cooldown) | Default cooldown period | `number` | `300` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | Desired number of instances in the ASG | `number` | n/a | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | Engine type like mysql,postgress | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | engine version | `string` | n/a | yes |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | n/a | `string` | n/a | yes |
| <a name="input_health_check_grace_period"></a> [health\_check\_grace\_period](#input\_health\_check\_grace\_period) | Health check Grace Period | `number` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | n/a | `string` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | DB identifier name | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | instance class | `string` | n/a | yes |
| <a name="input_instance_profile_arn"></a> [instance\_profile\_arn](#input\_instance\_profile\_arn) | ARN of instance profile | `string` | n/a | yes |
| <a name="input_instance_sg"></a> [instance\_sg](#input\_instance\_sg) | VPC Security Group ID for the instances | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to launch | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | SSH key name to use for the instances | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum number of instances in the ASG | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum number of instances in the ASG | `number` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | DB port number | `number` | n/a | yes |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | n/a | `string` | n/a | yes |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | snapshot identifier | `string` | n/a | yes |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | n/a | `string` | n/a | yes |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | storge type | `string` | n/a | yes |
| <a name="input_subnet_ids_private"></a> [subnet\_ids\_private](#input\_subnet\_ids\_private) | Private Subnets to use | `list(string)` | n/a | yes |
| <a name="input_subnet_ids_public"></a> [subnet\_ids\_public](#input\_subnet\_ids\_public) | public Subnets to use | `list(string)` | n/a | yes |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | Name of target group | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC to use | `string` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | Securiry group of DB | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_tg_arn"></a> [alb\_tg\_arn](#output\_alb\_tg\_arn) | n/a |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | n/a |

## Modules usage:



## ALB module usage:


The ALB module allows users to create an Application Load Balancer and Target Group. 
This module enables users to distribute incoming traffic across multiple targets, such as EC2 instances,in order to improve application availability and scalability.

To use this module,you need to provide the manditory input data into terraform.tfvars and for more information about usage of variables releated to RDS please check Reference.md file.

## Auto scaling module usage:

The Auto Scaling module allows users to create an auto scaling group that is attached to a target group. 

This group can automatically adjust the number of instances based on defined policies, helping to ensure that the application can handle fluctuations in traffic without any human intervention.

To use this module,you need to provide the manditory input data into terraform.tfvars and for more information about usage of variables releated to RDS please check Reference.md file.


## Database module usage:


This Terraform module creates an MySQL instance by using snapshot as a reference.

The module supports various RDS engines, such as Amazon Aurora, PostgreSQL, and MySQL.

To use this module,you need to provide the manditory input data into terraform.tfvars and for more information about usage of variables releated to RDS please check Reference.md file.
