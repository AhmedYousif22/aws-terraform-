
# for NAT gateways you need to create elastic IP 

resource "aws_eip" "nat-eip" {
    vpc = "true"
}

# create the reousrce NAT gateway

resource "aws_nat_gateway" "NAT-gateway" {
    allocation_id = "${aws_eip.nat-eip.id}"
    subnet_id = "${aws_subnet.public-subnet-1.id}"
    depends_on = "${aws_internet_gateway.terraform-IGW.id}" # depends on the internet gatway
}

# NAT gateway configuration in VPC 
# route table for nat gateway 

resource "aws_route_table" "private-route" {
    vpc_id = "${aws_vpc.terraform-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.NAT-gateway.id}"
    }
    tags = {
        Name = "private-route"
    }
}

# associate the route table with private subnets 

resource "aws_route_table_association" "private-subnet-route-1" {
    subnet_id = "${aws_subnet.private-subnet-1.id}"
    route_table_id = "${aws_route_table.private-route.id}"
}
resource "aws_route_table_association" "private-subnet-route-2" {
    subnet_id = "${aws_subnet.private-subnet-2.id}"
    route_table_id = "${aws_route_table.private-route.id}"
}

resource "aws_route_table_association" "private-subnet-route-3" {
    subnet_id = "${aws_subnet.private-subnet-3.id}"
    route_table_id = "${aws_route_table.private-route.id}"
}