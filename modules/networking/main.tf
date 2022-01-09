resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16" #var
  instance_tenancy = "default"
  tags = {
    Name = "vpc" #var
  }
}
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "ig"
  }
}
resource "aws_eip" "EIP" {
    vpc = true
    tags = {
        Name = "eip"
    }
}

resource "aws_nat_gateway" "NAT" {
    allocation_id = aws_eip.EIP.id
    subnet_id = aws_subnet.pubsub1.id
    tags = {
        Name = "nat"
    }

}