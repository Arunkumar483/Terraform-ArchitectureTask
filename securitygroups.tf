resource "aws_security_group" "lcsecuritygroup" {
  name        = "lcsecuritygroup"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.networking.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "lcsecuritygroup"
  }
}

#alb security grp
resource "aws_security_group" "albsecuritygroup" {
  name        = "albsecuritygroup"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.networking.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "albsecuritygroup"
  }
}
# rds security grp
resource "aws_security_group" "MYSQLsg" {
  name        = "akMYSQLsg"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.networking.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["116.0.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "MYSQLsg"
  }
}