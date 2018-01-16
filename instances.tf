# Creates an instance inside the specified subnet
resource "aws_instance" "example" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.default_sg.id}"]
  key_name = "${var.key_pair}"
  user_data = "${file("provisioner.sh")}"
}