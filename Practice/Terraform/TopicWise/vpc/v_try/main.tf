module "my_vpc_test" {
    source = "./module"
    vpc_cidr =  var.v_cidr
    project_name=var.p-name
    environment = var.env
}