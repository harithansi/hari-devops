resource "aws_launch_configuration" "new_lc" {
  name               = "asg-config"
  image_id           = var.ami_id
  instance_type      = var.instance_type
  security_groups = [var.instance_sg]
  key_name           = var.key_name
}



resource "aws_launch_template" "Launch_template" {
  name     = "asg-template"
  image_id = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.instance_sg]
  key_name               = var.key_name 
  iam_instance_profile {
  arn = "${var.instance_profile_arn}"
  }
}

/*resource "aws_autoscaling_group" "asg" {
  name                = var.asg_name
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids_private
  target_group_arns = [var.target_group_arn]
  health_check_type = "ELB"
  health_check_grace_period = var.health_check_grace_period
  default_cooldown = var.default_cooldown
  tag {
    key = "Name"
    value = "${var.asg_name}"
    propagate_at_launch = true
  }

 
  launch_template {
  
    id      = aws_launch_template.Launch_template.id
    version = "$Latest"
    
  }

}*/
########## ASG with Spot instance types
resource "aws_autoscaling_group" "asg" {
  name                = var.asg_name
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids_private
  target_group_arns = [var.target_group_arn]
  health_check_type = "ELB"
  health_check_grace_period = var.health_check_grace_period
  default_cooldown = var.default_cooldown
  capacity_rebalance  = true
  tag {
    key = "Name"
    value = "${var.asg_name}"
    propagate_at_launch = true
  }
  
  mixed_instances_policy {
    instances_distribution {
      on_demand_base_capacity                  = var.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
      spot_allocation_strategy                 = "price-capacity-optimized"
      #on_demand_allocation_strategy = "prioritized"
    }
    launch_template {
      launch_template_specification {
        launch_template_id =  aws_launch_template.Launch_template.id
        version            = "$Latest"
      }
      override {
        instance_type = var.instance_types[0]
      }
      override {
        instance_type = var.instance_types[1]
      }


    }

  }
}


####################### Create SNS topic for notification 

resource "aws_sns_topic" "DR_topic" {
    name = "Devops_DR"
    display_name = "Devops_DR"
}

resource "aws_sns_topic_subscription" "DR_subscription" {
  topic_arn = resource.aws_sns_topic.DR_topic.arn
  protocol = "email"
  #endpoint = "devops@simplilearn.net"
  endpoint = var.email
}

################## Scale in and scale out policies ########

resource "aws_cloudwatch_metric_alarm" "scale_out" {
  depends_on = [aws_autoscaling_group.asg]
  alarm_name          = "${var.asg_name}-High-CPU-Utilization-scale-up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "50"

  alarm_description = "This metric checks if the CPU utilization is >= 50% for 2 consecutive periods of 60 seconds."

  alarm_actions = [aws_autoscaling_policy.scale_out.arn,aws_sns_topic.DR_topic.arn]

  dimensions = {
    AutoScalingGroupName = "${var.asg_name}"
  }
}

resource "aws_autoscaling_policy" "scale_out" {
  depends_on = [aws_autoscaling_group.asg]
  name          = "${var.asg_name}-High-CPU-Utilization-scale-up"
  policy_type   = "StepScaling"
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = "${var.asg_name}"

  step_adjustment {
    scaling_adjustment = 1
    metric_interval_lower_bound = 0
  }

  metric_aggregation_type = "Average"
  estimated_instance_warmup = 300
  #alarm_names = "${var.asg_name}-High-CPU-Utilization-scale-up"
}


######################## Scale in Alarms and policies 

resource "aws_cloudwatch_metric_alarm" "scale_in" {
  depends_on = [aws_autoscaling_group.asg]
  alarm_name          = "${var.asg_name}-High-CPU-Utilization-scale-in"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "30"

  alarm_description = "This metric checks if the CPU utilization is <= 30% for 2 consecutive periods of 60 seconds."

  alarm_actions = [aws_autoscaling_policy.scale_in.arn,aws_sns_topic.DR_topic.arn]

  dimensions = {
    AutoScalingGroupName = "${var.asg_name}"
  }
}

resource "aws_autoscaling_policy" "scale_in" {
  depends_on = [aws_autoscaling_group.asg]
  name          = "${var.asg_name}-High-CPU-Utilization-scale-in"
  policy_type   = "StepScaling"
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = "${var.asg_name}"

  step_adjustment {

    metric_interval_upper_bound = 0
    scaling_adjustment = -1
    
  }
}