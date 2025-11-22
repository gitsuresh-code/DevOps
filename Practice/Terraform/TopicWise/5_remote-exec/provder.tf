terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket = "remote-backend-demo-11"
    key    = "remote-exec-demo"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

#terraform script to create S3buket using API service:
#aws s3api create-bucket --bucket remote-state-suresh --region us-east-1 --create-bucket-configuration LocationConstraint=us-east-1

provider "aws" {
  region = "us-east-1"
}

#----> this is store tfstate file in s3 bucket(remote-state-suresh) under key: local-demo