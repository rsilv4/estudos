//Cria instancia EC2

resource "aws_instance" "web01"{
    ami = "${var.amis}"
    instance_type = "${var.instance_type}"
    subnet_id = "${aws_subnet.rede_1.id}"
    vpc_security_group_ids = ["${aws_security_group.web_server.id}","${aws_security_group.allow_ssh.id}"]
    key_name = "${var.key_name}"
    tags {
        Name = "web01"
    }    
}

resource "aws_instance" "web02"{
    ami = "${var.amis}"
    instance_type = "${var.instance_type}"
    subnet_id = "${aws_subnet.rede_2.id}"
    vpc_security_group_ids = ["${aws_security_group.web_server.id}","${aws_security_group.allow_ssh.id}"]
    key_name = "${var.key_name}"
    tags {
        Name = "web02"
    }    
}

//Cria instancia do RDS
resource "aws_db_instance" "blog_rds_01"{
    identifier = "bd-rds-blog"
    allocated_storage = 10
    engine = "mysql"
    engine_version = "5.6.37"
    instance_class = "db.t2.micro"
    name = "blog_db"
    username = "blog_db"
    password = "7201rns5"
    vpc_security_group_ids = ["${aws_security_group.mysql_blog.id}"]
    db_subnet_group_name = "${aws_db_subnet_group.blog_db.id}"
    parameter_group_name = "default.mysql5.6"
}

