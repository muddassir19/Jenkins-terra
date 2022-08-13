variable "aws_region"{
    description = "The aws region"
    type        = string
    default     = "ap-south-1"
}

variable "instance_ami"{
    description = "The AMI ID of the instace"
    type        = string
    default     = "ami-076e3a557efe1aa9c"
}

variable "instance_type"{
    description = "The type of the instance"
    type        = string
    default     = "t2.micro"
}

variable "terraform_demo_tagname"{
    description = "terraform demo intance tag name"
    type        = string
    default     = "terraform_demo"
}
variable "vpc_cidr"{
    description = "The cidr of the vpc"
    type        = string
    default     = "10.0.0.0/16"
}

variable "vpc_tagname"{
    description = "The vpc tag name"
    type        = string
    default     = "my_vpc"
}

variable "public_subnet_cidr_block"{
    description = "The public subnet cidr block"
    type        = string
    default     = "10.0.0.0/24"
}

variable "public_subnet_tagname"{
    description = "The public subnet tag name"
    type        = string
    default     = "public_subnet"
}

variable "igw_tagname"{
    description = "Internet gateway tagname"
    type        = string
    default     = "igw"
}
variable "terraform_demo_sg_tagname"{
    description = "terraform_demo instance security group tag name"
    type        = string
    default     = "terraform_demo_sg"
}

variable "instance-key-name" {
  description = "The name of the SSH key to associate to the instance. Note that the key must exist already."
  type        = string
  default     = "pro"
}
