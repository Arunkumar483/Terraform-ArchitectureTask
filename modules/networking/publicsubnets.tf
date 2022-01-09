resource "aws_subnet" "pubsub1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "pubsub1"
  }
}

resource "aws_subnet" "pubsub2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "pubsub2"
  }
}
resource "aws_route_table_association" "pubsubassociation1" {
  subnet_id      = aws_subnet.pubsub1.id
  route_table_id = aws_route_table.pubrt.id
}
resource "aws_route_table_association" "pubsubassociation2" {
  subnet_id      = aws_subnet.pubsub2.id
  route_table_id = aws_route_table.pubrt.id
}