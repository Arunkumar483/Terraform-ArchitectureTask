resource "aws_subnet" "privsub1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "privsub1"
  }
}

resource "aws_subnet" "privsub2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "privsub2"
  }
}
resource "aws_route_table_association" "privsubassociation1" {
  subnet_id      = aws_subnet.privsub1.id
  route_table_id = aws_route_table.privrt.id
}
resource "aws_route_table_association" "privsubassociation2" {
  subnet_id      = aws_subnet.privsub2.id
  route_table_id = aws_route_table.privrt.id
}