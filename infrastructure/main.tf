provider "aws" {
  region                  = "eu-west-2"
  shared_credentials_file = "../.aws/credentials"
  profile                 = "aws-cred"
}

// 1. Create A Public VPC 
resource "aws_vpc" "public-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Public_VPC"
  }
}

// 2. Create a Internet Gateway
resource "aws_internet_gateway" "public-gateway" {
  vpc_id = aws_vpc.public-vpc.id
}

// 3. Create Custom Route Table
resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.public-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public-gateway.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_internet_gateway.public-gateway.id
  }

  tags = {
    Name = "Public_Route_Table"
  }
}

// 4. Create A Public Subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.public-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Public_Subnet"
  }
}

// 5. Associate Subnet with Route Table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-route.id

}

// 6. Create a Security Group
resource "aws_security_group" "allow-web" {
  name        = "allow_web_traffic"
  description = "Allow Inbound Web Traffic"
  vpc_id      = aws_vpc.public-vpc.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 2
    to_port     = 2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow_Web"
  }
}

















// Create EC2 Instance
resource "aws_instance" "ubuntu-instance" {
  ami           = "ami-0cd8ad123effa531a"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance"
  }
}
