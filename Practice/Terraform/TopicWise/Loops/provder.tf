
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0" # Specify a version constraint
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default" # Optional: specify an AWS CLI profile
}

