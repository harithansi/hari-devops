variable "ami_id" {
  type = string
  description = "AMI ID of the instance"
}

variable "instance_type" {
  type = string
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
  type = string
  description = "VPC Security Group ID for the instances"
}

variable "key_name" {
  type = string
  description = "SSH key name to use for the instances"
}

variable "asg_name" {
  type = string
  description = "Name of the Auto Scaling Group"
}

variable "min_size" {
  type = number
  description = "Minimum number of instances in the ASG"
}

variable "max_size" {
  type = number
  description = "Maximum number of instances in the ASG"
}

variable "desired_capacity" {
  type = number
  description = "Desired number of instances in the ASG"
}

variable "instance_profile_arn" {
  type = string
  description = "ARN of instance profile"
}

variable "health_check_grace_period" {
  type = number
  description = "Health check Grace Period"
  default = 300
}

variable "default_cooldown" {
  type = number
  description = "Default cooldown period"
  default = 300
}

variable "email" {
    type = string
    default = "haritdevops@gmail.com"
  
}

#############

variable "target_group_arn" {
  type = string
  description = "target group arn"
}

variable subnet_ids_private {
  type        = list(string)
  description = "public Subnets to use"
}