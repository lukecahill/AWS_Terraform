resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags {
        Name = "main-vpc"
    }
}

resource "aws_subnet" "main_subnet" {
    vpc_id = "${aws_vpc.main.id}"
    availability_zone = "us-east-1"
    cidr_block = "${aws_vpc.selected.cidr_block}"
}

resource "aws_internet_gateway" "gateway" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "Main Gateway"
    }
}

resource "aws_instance" "example" {
    # lookup using the map defined above. 
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.default_sg.id}"]
  key_name = ""
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