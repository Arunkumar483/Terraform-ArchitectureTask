output "vpc_id" {
  value=module.networking.vpc_id
}
output "lcsecuritygroup_id" {
  value=aws_security_group.lcsecuritygroup.id
}
output "PublicDNS" {
    value = module.application.PublicDNS
}