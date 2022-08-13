# Creating ec2-instance in aws...
#configure the aws provider

provider "aws" {
    region = var.aws_region
}

#creating the ec2-instance
resource "aws_instance" "terraform_demo" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.instance-key-name
  vpc_security_group_ids = [aws_security_group.terraform_demo_sg.id]
  subnet_id              = aws_subnet.public_subnet.id
  tags= {
    Name = var.terraform_demo_tagname
  }
}

#creating the vpc with cidr
resource "aws_vpc" "my_vpc"{
    cidr_block           = var.vpc_cidr
    instance_tenancy     = "default"
    enable_dns_hostnames = true
    tags ={
        Name = var.vpc_tagname
    }
}

# creating the subnets in vpc
resource "aws_subnet" "public_subnet"{
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.public_subnet_cidr_block
    tags ={
        Name = var.public_subnet_tagname
    }
}

# creating internet gateway in public sunbnet
resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.my_vpc.id
    tags={
        Name = var.igw_tagname
    }
}

#creating Route table in vpc  and add route in public subnet

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.my_vpc.id

    route {

        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
  
}

#Ceate a association between route_table and public_subnets

resource "aws_route_table_association" "rt_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt.id
}
#creating security group inbound, ports 22,80,443 and 800 outbound anywhere

resource "aws_security_group" "terraform_demo_sg" {
  name        = var.terraform_demo_sg_tagname
  description = "terraform_demo_sg_inbound_outboubd_rules"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
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
        Name = var.terraform_demo_sg_tagname
    }
}
