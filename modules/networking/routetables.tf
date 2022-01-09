resource "aws_route_table" "pubrt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    Name = "pubrt"
  }
}
resource "aws_route_table" "privrt" {
  vpc_id = aws_vpc.vpc.id
   route {
    cidr_block              = "0.0.0.0/0"
    nat_gateway_id          = aws_nat_gateway.NAT.id
  }
  tags = {
    Name = "privrt"
  }
}

