resource "aws_instance" "terraform-instance" {
    ami = "${lookup(var.AMIs, var.AWS_REGION)}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public-subnet-1.id}"
    security_groups = [aws_security_group.terraform-SG.id]
    key_name = "terraform-key"
}

