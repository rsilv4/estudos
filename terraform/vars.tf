variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
    default = "sa-east-1" 
}

variable "instance_type"{
    default = "t2.micro"
}

variable "amis"{
    default = "ami-10547475"
}

variable "key_name"{
    default = "renan"
}