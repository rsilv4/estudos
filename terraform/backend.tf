//Configuração load balancer
resource "aws_elb" "web_elb"{
    name = "web-elb"
    availability_zones = "${var.aws_zones}"
    
    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        target = "HTTP:80/"
        interval = 30
    }

    instances = ["${aws_instance.web01.id}" , "${aws_instance.web02.id}"]

    cross_zone_load_balancing = true
    idle_timeout = 400
    connection_draining = true
    connection_draining_timeout = 400

    tags {
        Name = "Web ELB"
    }
}



