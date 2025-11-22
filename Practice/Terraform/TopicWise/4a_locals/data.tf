data "aws_ami" "joindevops" {
    owners           = ["973714476881"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}

#------->above code is extract ami_id based on filters




data "aws_s3_bucket" "check_bucket" {
  bucket = "remote-backend-demo-11"
}

output "bucket_exists" {
  value = data.aws_s3_bucket.check_bucket.id
}

#to check s3bukcet is available or not