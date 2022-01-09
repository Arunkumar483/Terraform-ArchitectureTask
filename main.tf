provider "aws" {
    region = "us-east-1"
}

module "networking" {
    source = "./modules/networking"
}   


module "application" {
    source = "./modules/application"
     vpc_id = module.networking.vpc_id
    lcsecuritygroup_id = aws_security_group.lcsecuritygroup.id
    albsecuritygroup_id=aws_security_group.albsecuritygroup.id
    pubsub1_id = module.networking.pubsub1_id
    pubsub2_id = module.networking.pubsub2_id
    privsub1_id = module.networking.privsub1_id
    privsub2_id = module.networking.privsub2_id
    rds_dns=module.RDS.rds_dns
}

module "RDS" {
  source = "./modules/rds"
  securitygroup_id = aws_security_group.MYSQLsg.id
  privsub1_id = module.networking.privsub1_id
  privsub2_id = module.networking.privsub2_id
}

