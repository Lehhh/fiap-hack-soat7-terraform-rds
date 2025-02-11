module "prod" {
  source = "../../infra"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.61.0"
    }
  }
  required_version = ">= 0.14.9"
  backend "s3" {
    bucket         = "soat7-lshiniti-postgres-rds-state"
    key            = "terraform/rds/terraform.tfstate"
    region         = "us-east-1"
  }
}

data "aws_s3_bucket" "existing_bucket" {
  bucket = "soat7-lshiniti-postgres-rds-state"
}

resource "aws_s3_bucket" "terraform_state" {
  count  = length(data.aws_s3_bucket.existing_bucket.id) > 0 ? 0 : 1
  bucket = "soat7-lshiniti-postgres-rds-state"
}