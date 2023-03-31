provider "aws" {
  region  = "us-west-1"
}

terraform {
  backend "s3" {
  bucket = "terraform-statefolder"
  key = "prod/terraform.tfstate"
  region = "us-west-1"
  }
}
