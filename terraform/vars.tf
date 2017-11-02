variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "aws_zones" {
    type = "list"
    description = "Lista de zonas disponiveis"
    default = ["sa-east-1a" , "sa-east-1c"]
}
variable "amis"{
    default = "ami-10186f7c"
}

variable "key_name"{
    default = "renan"
}

variable "instance_type"{
    default = "t2.micro"
}

variable "cidr_block_1"{
    default = "10.100.0.0/24"
}

variable "cidr_block_2"{
    default = "10.100.1.0/24"
}