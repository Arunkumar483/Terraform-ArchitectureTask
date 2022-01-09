resource "aws_db_instance" "MySQL" {

  allocated_storage      = 20
  identifier             = var.db_identifier
  engine                 = var.engine
  engine_version         = var.db_version
  instance_class         = var.instance_type
  name                   = var.dbname
  username               = var.username
  password               = length(var.password) >= 8 ? var.password : var.default_password
  port                   = var.port
  db_subnet_group_name   = aws_db_subnet_group.DBSubnetGroup.name
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.securitygroup_id]
}
resource "aws_db_subnet_group" "DBSubnetGroup" {
  name       = "dbsubnetgroup"
  subnet_ids = [var.privsub1_id,var.privsub2_id]
  tags = {
    Name = "RDSSubnetGroup"
  }
}