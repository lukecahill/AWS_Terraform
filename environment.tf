# Create a main VPC
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags {
        Name = "main-vpc"
    }
}

# Add a subnet inside the VPC
resource "aws_subnet" "main_subnet" {
    vpc_id = "${aws_vpc.main.id}"
    availability_zone = "us-west-2a"
    cidr_block = "${aws_vpc.main.cidr_block}"
    map_public_ip_on_launch = true
}

# Attach an Internet Gateway to the VPC
resource "aws_internet_gateway" "gateway" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "Main Gateway"
    }
}

# ROUTING TABLES ----------------------
resource "aws_route_table" "routes" {
    vpc_id = "${aws_vpc.main.id}"
    tags {
        Name = "Main routing table"
    }
}

# Adds destination CIDR block to general internet
resource "aws_route" "route" {
    route_table_id = "${aws_route_table.routes.id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gateway.id}"
}

# Associates the routes with the VPC
resource "aws_main_route_table_association" "r" {
    route_table_id = "${aws_route_table.routes.id}"
    vpc_id = "${aws_vpc.main.id}"
}

# Explicity associate the subnet with the route table
resource "aws_route_table_association" "assoc_a" {
    subnet_id = "${aws_subnet.main_subnet.id}"
    route_table_id = "${aws_route_table.routes.id}"
}