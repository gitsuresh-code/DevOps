terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0" # Specify a version constraint
    }
  }
}

terraform {

backend "s3" {
    bucket = "project-bucket-suresh"
    key = "use/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-lock-table"   --- Have big process to use this
    use_lockfile = true
    encrypt = true
  }

}

provider "aws" {
  region = "us-east-1"
  profile = "default" # Optional: specify an AWS CLI profile
}



