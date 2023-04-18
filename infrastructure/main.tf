provider "aws" {
  region                  = "eu-west-2"
  shared_credentials_file = "../.aws/credentials"
  profile                 = "aws-cred"
}

// Create A Public VPC & Subnet 
resource "aws_vpc" "public-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Public-VPC"
  }
}

resource "aws_subnet" "Public-subnet" {
  vpc_id     = "aws_vpc.public-vpc"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public-Subnet"
  }
}


// Create EC2 Instance-1
resource "aws_instance" "Ubuntu_Instance" {
  ami           = "ami-0cd8ad123effa531a"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance"
  }
}
