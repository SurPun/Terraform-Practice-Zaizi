# EC2 
variable "ec2_instance_name" {
  type    = string
  default = "EC2"
}

variable "ec2_intance_type" {
  type    = string
  default = "t2.micro"
}

# terraform plan -var-file=variables/var_dev.tfvars
# terraform apply -var-file=variables/var_dev.tfvars
