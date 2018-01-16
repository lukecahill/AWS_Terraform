# Create a default security group which allows all traffic out
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

# Add a rule to the defined SG, which allows all traffic in (not recommended)
resource "aws_security_group_rule" "allow_all" {
    type = "ingress"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.default_sg.id}"
}