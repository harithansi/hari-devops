data "aws_vpc" "vpc" {
    filter {
      name = "tag:name"
      values = ["example-vpc"]
    }
  
}

output "vpcid" {

 value = data.aws_vpc.vpc.id
}