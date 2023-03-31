region             = "us-west-1"
vpc_id             = "vpc-08d52b99cdc60da96"
subnet_ids_public  = ["subnet-0a7170aa2a7be34e7", "subnet-0cb9914b124ee5155"]
subnet_ids_private = ["subnet-0e965e3b0ae536166", "subnet-007cf9f546aa2b6e0"]
tg_name            = "hari-tg" #Target group
alb_name           = "hari-test-ALB"
alb_sg             = "sg-0346770ca5a672453" ## ALB Sg name: lms-elb-sg
health_check_path  = "/smplhlthchk_2020ok.php"
ssl_policy         = "ELBSecurityPolicy-2016-08"
certificate_arn    = "arn:aws:acm:us-west-1:249437634744:certificate/169df275-2f2c-4983-bd7f-306d61b66dce"

# ASG Configuration
asg_name         = "TestASG"
min_size         = "1"
max_size         = "4"
desired_capacity = "1"
create_module    = "true"
instance_sg      = "sg-01c577f83e9ab1806" #### Instanc SG name: elb-private-subnet-security3
key_name         = "hari-us-west-1"
instance_type    = "t2.micro"
ami_id           = "ami-084f2afec26f8b439"

############ DATABASE CONFIGURATIONS 
allocated_storage         = 40
snapshot_identifier       = "localsnap"
#snapshot_identifier = ""
storage_type              = "gp3"
engine                    = "mysql"
engine_version            = "5.7.38"
instance_class            = "db.t2.micro"
identifier                = "simpli-qa-i2rds-testing"
vpc_security_group_ids    = ["sg-0c46dc3c0d9f1e7d9"] ## RDS security group name: i2_rds_securitygroup
db_subnet_group_name      = "lms_db_subnet"          ## DB subnetGroup name
final_snapshot_identifier = "localsnap"
port                      = 3306
publicly_accessible       = "true"
skip_final_snapshot       = "true"
