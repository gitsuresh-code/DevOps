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
    key = "dynamodb/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-table"   #--- to use this dynamodb_table please run below mentioned script
    #use_lockfile = true
    encrypt = true
  }

}

#dynamodb_table script
# aws dynamodb create-table \
#   --table-name terraform-lock-table \
#   --attribute-definitions AttributeName=LockID,AttributeType=S \
#   --key-schema AttributeName=LockID,KeyType=HASH \
#   --billing-mode PAY_PER_REQUEST \
#   --region us-east-1

provider "aws" {
  region = "us-east-1"
  profile = "default" # Optional: specify an AWS CLI profile
}



