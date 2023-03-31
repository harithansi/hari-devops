AWS ALB and Auto Scaling Terraform Module variable usage:

vpc_id: The ID of the VPC where the ALB and Auto Scaling group will be created.
tg_name: The name of the target group for the ALB.
subnet_ids_public: A list of public subnet IDs in the VPC where the ALB will be created.
alb_name: The name of the ALB.
alb_sg: The security group for the ALB.
health_check_path: The path for the health check of the ALB.
ssl_policy: The SSL policy for the ALB.
certificate_arn: The ARN of the certificate for the ALB.
asg_name: The name of the Auto Scaling group.
max_size: The maximum size of the Auto Scaling group.
min_size: The minimum size of the Auto Scaling group.
desired_capacity: The desired capacity of the Auto Scaling group.
key_name: The name of the SSH key pair for the EC2 instances in the Auto Scaling group.
ami_id: The ID of the Amazon Machine Image (AMI) for the EC2 instances in the Auto Scaling group.
instance_sg: The security group for the EC2 instances in the Auto Scaling group.
instance_type: The type of the EC2 instances in the Auto Scaling group.
subnet_ids_private: A list of private subnet IDs in the VPC where the EC2 instances in the Auto Scaling group will be launched.



RDS Instance Terraform Module variable usage:

allocated_storage: The amount of storage (in gibibytes) to allocate to the RDS instance.

snapshot_identifier: The identifier for the snapshot to restore from. If not provided, a new instance will be created.

storage_type: The type of storage to use for the RDS instance. Valid values are "standard" and "gp2","gp3".

engine: The name of the database engine to use for the RDS instance.

engine_version: The version of the database engine to use for the RDS instance.

instance_class: The instance type to use for the RDS instance.

identifier: A unique identifier for the RDS instance.

vpc_security_group_ids: A list of security group IDs associated with the RDS instance.

db_subnet_group_name: The name of the subnet group associated with the RDS instance.

publicly_accessible: Specifies whether the RDS instance should be publicly accessible. Valid values are "true" and "false".

skip_final_snapshot: Specifies whether to skip creating a final snapshot before deleting the RDS instance. Valid values are "true" and "false".

port: The port to use for the RDS instance.

final_snapshot_identifier: The identifier for the final snapshot of the RDS instance.



## General AWS Cli commands to display security groups, VPCID and Name, Assocaited subnets

### Display list of security groups
aws ec2 describe-security-groups --query 'SecurityGroups[*].{Name: GroupName, ID: GroupId}' --output table|egrep  "elb-private-subnet-security3|lms-elb-sg|i2_rds_securitygroup"


############# Display the list of VPCID and Name, associated subnets.

aws ec2 describe-vpcs --query 'Vpcs[*].{VPCID:VpcId,VPCName:Tags[?Key==`Name`].Value|[0],Subnets:Subnets[*].SubnetId}' --output table
aws ec2 describe-subnets --query 'Subnets[*].{VPCID:VpcId,SubnetID:SubnetId,SubnetName:Tags[?Key==`Name`].Value|[0]}' --output table


############### Displays DB subnetname and associated subnets.
aws rds describe-db-subnet-groups --query 'DBSubnetGroups[*].{SubnetGroupName:DBSubnetGroupName,Subnets:Subnets[*].SubnetIdentifier}' --output table