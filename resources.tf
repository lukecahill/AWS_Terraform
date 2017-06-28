resource "aws_instance" "example" {
    # lookup using the map defined above. 
  ami           = "${var.ami}"
  instance_type = "t2.micro"
}

resource "aws_security_group" "default_sg" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_all"
  }
}

resource "aws_security_group_rule" "allow_all" {
    type = "ingress"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]security_group_id = "${aws_security_group.default_sg.id}"
}