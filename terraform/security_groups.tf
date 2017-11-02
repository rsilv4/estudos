//Regra para liberar trafego ssh
resource "aws_security_group" "allow_ssh"{
    name = "allow_ssh"
    description = "Libera trafego ssh"
    vpc_id = "${aws_vpc.blog.id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
        egress {
        from_port = 1024
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "Allow SSH"
    }
}

//Cria security group para servidores web
resource "aws_security_group" "web_server"{
    name = "Web Server"
    description = "Trafego http e https"
    vpc_id = "${aws_vpc.blog.id}"

    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        from_port = 1024
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

//Cria security group para servidor de banco de dados
resource "aws_security_group" "mysql_blog"{
    name = "mysql blog"
    description = "Libera acesso dos servidores web a instancia do mysql"
    vpc_id = "${aws_vpc.blog.id}"

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["${aws_instance.web01.private_ip}","${aws_instance.web02.private_ip}"]
        //cidr_blocks = ["0.0.0.0/0"]
        //,"${aws_instance.web0002.private_ip}"
    }

    egress {
        from_port = 1024
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
