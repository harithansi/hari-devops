region             = "us-west-1"
vpc_id             = "vpc-02c9ea5bab32d6257"
subnet_ids_public  = ["subnet-0879b6a81bb1c25b4", "subnet-000864f067c2d4e2d"]
subnet_ids_private = ["subnet-056e17baf4e37fb35", "subnet-08c963c0124e9e703"]
tg_name            = "hari-tg" #Target group
alb_name           = "hari-test-ALB"
alb_sg             = "sg-0d41562e17ccad78f" ## ALB Sg name: 
health_check_path  = "/"
ssl_policy         = "ELBSecurityPolicy-2016-08"
certificate_arn    = "arn:aws:acm:us-west-1:959705468080:certificate/4c92ab3d-773f-4795-94e9-a66ab4dfbdfe"


# ASG Configuration
asg_name                                 = "TestASG"
min_size                                 = "1"
max_size                                 = "4"
desired_capacity                         = "1"
create_module                            = "true"
instance_sg                              = "sg-02c06339afcd28a95" #### Instanc SG name: elb-private-subnet-security group
key_name                                 = "baston"
instance_type                            = "t2.micro"
instance_types                           = ["t2.micro", "t3a.medium"]
on_demand_base_capacity                  = "1"
on_demand_percentage_above_base_capacity = "30"
#ami_id                    = "ami-084f2afec26f8b439"
ami_id                    = "ami-0ce40d193ef4c2f52" ## WEB AMI
instance_profile_arn      = "arn:aws:iam::959705468080:instance-profile/MyEC2InstanceProfile"
health_check_grace_period = 300
default_cooldown          = 200
email                     = "haritdevops@gmail.com"

############ DATABASE CONFIGURATIONS 
allocated_storage         = 40
snapshot_identifier       = "localsnap"
storage_type              = "gp3"
engine                    = "mysql"
engine_version            = "5.7.38"
instance_class            = "db.t2.micro"
identifier                = "simpli-qa-i2rds-testing"
vpc_security_group_ids    = ["sg-032ba45856c4e66da"] ## RDS security group name: DB security group name
db_subnet_group_name      = "example_db_subnet"          ## DB subnetGroup name
final_snapshot_identifier = "localsnap-Final-v1"     ## correction need to be done
port                      = 3306
publicly_accessible       = "true"
skip_final_snapshot       = "true"
