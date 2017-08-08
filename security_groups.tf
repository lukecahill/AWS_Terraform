resource "aws_security_group" "default_sg" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  egress {
      from_port =   0
      to_port   = 65535
      protocol  = "tcp"
      cidr_blocks   = ["0.0.0.0/0"]
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
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.default_sg.id}"
}