#1 vpc code below

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = merge (
    local.common_tags,
    var.vpc_tags,
    {
      Name = local.common_name_suffix
    }
  )
}


#2 IGW code goes here
resource "aws_internet_gateway" "v_igw" {
vpc_id = aws_vpc.my_vpc.id 

  tags = merge (
    local.common_tags,
    var.igw_tags,
    {
      Name = local.common_name_suffix
    }
  )

}

