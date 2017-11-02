//Define uma rede
resource "aws_vpc" "blog" {
    cidr_block = "10.100.0.0/16"
}

//Define subrede
resource "aws_subnet" "rede_1"{
    vpc_id = "${aws_vpc.blog.id}"
    cidr_block = "${var.cidr_block_1}"
    //map_public_ip_on_launch = "true"
    availability_zone = "sa-east-1a"
    tags{
        Name = "Rede Publica 1"
    }
}

resource "aws_subnet" "rede_2"{
    vpc_id = "${aws_vpc.blog.id}"
    cidr_block = "${var.cidr_block_1}"
    //map_public_ip_on_launch = "true"
    availability_zone = "sa-east-1c"
    tags{
        Name = "Rede Publica 2"
    }
}

//define Gateway pradrão
resource "aws_internet_gateway" "gw_blog"{
    vpc_id = "${aws_vpc.blog.id}"
    tags{
        Name = "Gateway blog"
    }
}

//Cria grupo de subrede para banco
resource "aws_db_subnet_group" "blog_db"{
    name = "main"
    description = "Grupo de subnets"
    subnet_ids = ["${aws_subnet.rede_1.id}" , "${aws_subnet.rede_2.id}"]
    tags{
        Name = "Grupo de subnets blog"
    }
}

