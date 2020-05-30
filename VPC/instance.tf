resource "aws_instance" "terraform-instance" {
    ami = "${lookup(var.AMIs, var.AWS_REGION)}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public-subnet-1.id}"
    security_groups = [aws_security_group.terraform-SG.id]
    key_name = "terraform-key"
    tags = {
        Name = "terraform-instance"
    }
    user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"
} # USER DATA this will use the scripts to mount the ebs volume whener the isntance spins up

resource "aws_ebs_volume" "terraform-volume" {
    availability_zone = "eu-west-1a"
    size = "20"
    type = "gp2"
    tags = {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "terraform-volume-attachement" {
    device_name = "${var.INSTANCE_DEVICE_NAME}" # ref to the variable of devie name 
    volume_id = "${aws_ebs_volume.terraform-volume.id}"
    instance_id = "${aws_instance.terraform-instance.id}"
}



