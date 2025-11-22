terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket = "remote-backend-demo-11"
    key    = "local-exec-demo"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

#terraform script to create S3buket using API service:
#aws s3api create-bucket --bucket remote-backend-demo-11--region us-east-1 --create-bucket-configuration LocationConstraint=us-east-1

provider "aws" {
  region = "us-east-1"
}

#----> this is store tfstate file in s3 bucket(remote-backend-demo-11) under key: local-exec-demo