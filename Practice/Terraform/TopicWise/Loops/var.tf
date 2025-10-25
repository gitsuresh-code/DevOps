
variable "instances" {
    default = [ "frontend", "catalogue", "user", "mongodb","cart" ]
}

#var.instances[count.index] for mongodb [count.index=0]

variable "zone_id" {
    default = "Z04272802545XSOGBRNOM" #replace with your zoneid
}

#var.zone_id

variable "domain_name" {
    default = "sureshdevops.fun"
}

#var.domain_name
