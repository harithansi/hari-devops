#variables.tf
variable vpc_id {
  type        = string
  description = "VPC to use"
}

variable "alb_name" {
  type = string
  description = "Name of ALB"
}

variable "tg_name" {
  type = string
  description = "name of target group"
}

variable "alb_sg" {
  type = string
  description = "name of ALB securiry group"
}

variable "health_check_path" {
  type = string
  description = "health check path"
}

variable "ssl_policy" {
  type = string
  description = "ssl policy "
}

variable "certificate_arn" {
  type = string
  description = "certificate ARN"
}


variable subnet_ids_public {
  type        = list(string)
  description = "public Subnets to use"
}

