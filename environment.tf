resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags {
        Name = "main-vpc"
    }
}

resource "aws_subnet" "main_subnet" {
    vpc_id = "${aws_vpc.main.id}"
    availability_zone = "us-west-2a"
    cidr_block = "${aws_vpc.main.cidr_block}"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gateway" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "Main Gateway"
    }
}

data "aws_route_table" "main_routes" {
    subnet_id = "${aws_subnet.main_subnet.id}"
}

resource "aws_route" "main_route" {
    route_table_id = "${data.aws_route_table.main_routes.id}"
    destination_cidr_block = "10.0.0.0/16"
}