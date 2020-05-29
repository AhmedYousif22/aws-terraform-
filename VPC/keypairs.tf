resource "aws_key_pair" "mykeypair" {
    key_name = "mykeypair"
    public_key = "${var.PATH_TO_PUBLIC_KEY}"
}