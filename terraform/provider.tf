provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "jumia-devops-tf-up-and-running-state"
    key    = "global/s3/terraform.tfstate"
    region = "eu-west-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "jumia-devops-tf-up-and-running-state"
    encrypt        = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "4.45"
    }
  }
}

