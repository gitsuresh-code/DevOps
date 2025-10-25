resource "aws_instance" "Terraform" { 
	ami = var.image_id
    instance_type = var.type
	vpc_security_group_ids = [aws_security_group.allow_all.id]
	
	tags = var.ec2_tags
		
}

resource "aws_security_group" "allow_all" {
	name = var.sg_name
		egress {
			from_port = var.egress_from_port
			to_port   = var.egress_to_port
			protocol  = var.egress_protocol
			cidr_blocks = var.egress_cidrblock
		}
		ingress { 
			from_port = var.ingress_from_port
			to_port   = var.ingress_to_port
			protocol  = var.ingress_protocol
			cidr_blocks = var.ingress_cidrblock
		}
	tags = {
	Name="allow-all"
	}

}