# EC2 
variable "ec2_instance_name" {
  type = string
}

variable "ec2_intance_type" {
  type = string
}

# terraform plan -var-file=var_dev.tfvars
# terraform apply -var-file=var_dev.tfvars
