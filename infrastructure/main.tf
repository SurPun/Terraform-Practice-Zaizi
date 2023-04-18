provider "aws" {
  region                  = "eu-west-2"
  shared_credentials_file = "../.aws/credentials"
  profile                 = "aws-cred"
}

// Create ec2 Instance-1
resource "aws_instance" "Ubuntu_Instance" {
  ami           = "ami-0cd8ad123effa531a"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance"
  }
}
