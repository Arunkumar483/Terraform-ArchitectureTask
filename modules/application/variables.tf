variable "vpc_id" {
  description = "vpc id for target group"
  type = string
}
variable "lcsecuritygroup_id" {
  description = "lc securitygroup from root folder"
  type = string
}
variable "albsecuritygroup_id" {
  description = "alb securitygroup from root folder"
  type = string
}

variable "pubsub1_id" {
  description = "pubsub1 from n/w module for alb "
}
variable "pubsub2_id" {
  description = "pubsub2 from n/w module for alb "
}

variable "privsub1_id" {
  description = "privsub1 from n/w module for alb "
}
variable "privsub2_id" {
  description = "privsub2 from n/w module for alb "
}

variable "key_name" {
  description = "name of the key pair"
  type        = string
  default     = "amohandas@presisio.com@pscg-training key pair"

}
variable "rds_dns" {
  description = "dns of rds instance "
}

