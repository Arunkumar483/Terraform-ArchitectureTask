
variable "engine" {
  description = "engine type of db to be created"
  type        = string
  default     = "mysql"
}
variable "securitygroup_id" {
  description = "security groups for rds instances"

}


variable "db_version" {
  description = "version of db server to be created"
  default     = "8.0.23"
}


variable "instance_type" {
  description = "instance class of db"
  type        = string
  default     = "db.t3.micro"
}

variable "db_identifier" {
  description = "name of db server to be created"
  type        = string
  default     = "akmysql"
}

variable "dbname" {
  description = "name of db to be created inside the server"
  type        = string
  default     = "crud_db"
}
variable "username" {
  description = "username of the db server"
  type        = string
  default     = "root"
}

variable "password" {
  description = "password of the db server (should be 8 characters)"
  type        = string
  default     = "rootroot"
}
variable "default_password" {
  description = "default password of the db server (should be 8 characters)"
  type        = string
  default     = "rootroot"
}

variable "port" {
  description = "port of the db server to be exposed"
  type        = string
  default     = "3306"
}

variable "privsub1_id" {
  description = "privsub1 from n/w module for alb "
}
variable "privsub2_id" {
  description = "privsub2 from n/w module for alb "
}

