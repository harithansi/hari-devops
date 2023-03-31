
############ ALB variables ###########

variable "vpc_id" {
  type        = string
  description = "VPC to use"
}

variable "alb_name" {
  type        = string
  description = "Name of Alb"
}

variable "tg_name" {
  type        = string
  description = "Name of target group"
}

variable "alb_sg" {
  type        = string
  description = "ALB security group ID"
}

variable "health_check_path" {
  type = string
}

variable "ssl_policy" {
  type = string
}

variable "certificate_arn" {
  type = string
}


variable "subnet_ids_private" {
  type        = list(string)
  description = "Private Subnets to use"
}
variable "subnet_ids_public" {
  type        = list(string)
  description = "public Subnets to use"
}
################## ASG variables ###########

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "ami_id" {
  type        = string
  description = "AMI ID of the instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type to launch"
}

variable "instance_types" {
  type    = list(string)
  default = ["t3.medium", "t3a.medium"]
}

variable "on_demand_base_capacity" {
  type        = number
  description = "The number of on-demand instances to start."
}

variable "on_demand_percentage_above_base_capacity" {
  type        = number
  description = "The percentage of additional on-demand instances to start, above the on_demand_base_capacity value."
}


variable "instance_sg" {
  type        = string
  description = "VPC Security Group ID for the instances"
}

variable "key_name" {
  type        = string
  description = "SSH key name to use for the instances"
}

variable "asg_name" {
  type        = string
  description = "Name of the Auto Scaling Group"
}

variable "min_size" {
  type        = number
  description = "Minimum number of instances in the ASG"
}

variable "max_size" {
  type        = number
  description = "Maximum number of instances in the ASG"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of instances in the ASG"
}

variable "instance_profile_arn" {
  type        = string
  description = "ARN of instance profile"
}

variable "health_check_grace_period" {
  type        = number
  description = "Health check Grace Period"
}

variable "default_cooldown" {
  type        = number
  description = "Default cooldown period"
  default     = 300
}

variable "email" {
  type    = string
  default = "devops@simplilearn.net"

}

############## Database variables ##########

variable "allocated_storage" {
  type        = number
  description = "storage size"
}

variable "snapshot_identifier" {
  type        = string
  description = "snapshot identifier"
}

variable "storage_type" {
  type        = string
  description = "storge type"
}

variable "engine" {
  type        = string
  description = "Engine type like mysql,postgress"
}

variable "engine_version" {
  type        = string
  description = "engine version"
}

variable "instance_class" {
  type        = string
  description = "instance class"
}

variable "identifier" {
  type        = string
  description = "DB identifier name"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Securiry group of DB"
}

variable "db_subnet_group_name" {
  type        = string
  description = "DB subnet name"
}

variable "publicly_accessible" {
  type = string
}

variable "skip_final_snapshot" {
  type = string
}

variable "port" {
  type        = number
  description = "DB port number"
}

variable "final_snapshot_identifier" {
  type = string
}
