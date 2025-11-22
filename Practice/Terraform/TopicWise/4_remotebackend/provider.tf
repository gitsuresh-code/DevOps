terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
  backend "s3" {
    bucket = "remote-backend-demo-11"
    key = "remote_state_demo"
    use_lockfile = true
    encrypt = true
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
