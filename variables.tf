variable "access_key" { 
  description = "AWS access key"
  default = "AKIAJWB2IO2H454E5EBA"
}

variable "secret_key" { 
  description = "AWS secert access key"
  default = "1uwJe9WKUkeQ+x6tWNmJ2+hia66/ZT0LM34Sxxhe"
}

variable "region"     { 
  description = "AWS region"
  default     = "us-east-1" 
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.128.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.128.1.0/24"
}

variable "salt_master" {
  description = ".."
  default     = "10.128.1.99"
}

/* Ubuntu 14.04 amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-west-1 = "ami-049d8641" 
    us-east-1 = "ami-a6b8e7ce"
  }
}

variable "project" { 
  description = "Project name"
  default = "terra-test"
}
