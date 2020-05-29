resource "aws_security_group" "terraform-SG" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    name = "allow ssh access"
    description = "This is to allow the ssh access to the instance"
    egress { # outbound
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress { # Inbound
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        Name = "terraform-SG"
    }
}