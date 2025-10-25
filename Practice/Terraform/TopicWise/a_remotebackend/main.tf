provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Suresh" {
    instance_type = "t3.micro"
    ami = "ami-09c813fb71547fc4f"
    tags = {
        Name = "Suresh"
    }
  
}

resource "aws_s3_bucket" "S3_bucket" {
    bucket = "suresh_remote_state"
      
}

resource "aws_dynamodb_table" "terraform_lock" {
name = "dynamodb_lock"
billing_mode = "PAY_PER_REQUEST"
hash_key = "LockID"

attribute {
  name = "LockID"
  type = "S" # type is string or boolean 
}
  
}

