variable "i_type" {
  type = string
  validation {
    condition = contains (["t3.micro","t2.micro","t4.micro"],var.i_type)
    error_message = "Please enter the values in range of: t3.micro, t2.micro,t4.micro"
 } 
}