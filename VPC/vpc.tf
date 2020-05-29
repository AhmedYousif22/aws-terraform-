# VPC 

resource "aws_vpc" "terraform-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = "true"
    enable_dns_support = "true"
    enable_classiclink = "false"
    tags = {
        Name = "terraform-vpc"
    }
}

# Internet gateway 

resource "aws_internet_gateway" "terraform-IGW" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    tags = {
        Name = "terraform-IGW"
    }
}


# Suubnets 

# Public subnets 
resource "aws_subnet" "public-subnet-1" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-1a"
    tags = {
        Name = "public-subnet-1"
    }
}

resource "aws_subnet" "public-subnet-2" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-1b"
    tags = {
        Name = "public-subnet-2"
    }
}

resource "aws_subnet" "public-subnet-3" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-1c"
    tags = {
        Name = "public-subnet-3"
    }
}


# Route for public 

resource "aws_route_table" "Public-route" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.terraform-IGW.id}"
    }
    tags = {
        Name = "Public-route"
    }
}

# Associate the route table with public subnets 

resource "aws_route_table_association" "public-subnet-1-route" {
    subnet_id = "${aws_subnet.public-subnet-1.id}"
    route_table_id = "${aws_route_table.Public-route.id}"   
}
resource "aws_route_table_association" "public-subnet-2-route" {
    subnet_id = "${aws_subnet.public-subnet-2.id}"
    route_table_id = "${aws_route_table.Public-route.id}"   
}
resource "aws_route_table_association" "public-subnet-3-route" {
    subnet_id = "${aws_subnet.public-subnet-3.id}"
    route_table_id = "${aws_route_table.Public-route.id}"   
}



# Private subnets 

resource "aws_subnet" "private-subnet-1" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-1a"
    tags = {
        Name = "private-subnet-1"
    }
}

resource "aws_subnet" "private-subnet-2" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-1b"
    tags = {
        Name = "private-subnet-2"
    }
}

resource "aws_subnet" "private-subnet-3" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-1c"
    tags = {
        Name = "private-subnet-3"
    }
}
