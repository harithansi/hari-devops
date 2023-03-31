variable "allocated_storage" {
  type = number
  description = "storage size"
}

variable "snapshot_identifier" {
  type = string
  description = "snapshot identifier"
}

variable "storage_type" {
  type = string
  description = "storge type"
}

variable "engine" {
  type = string
  description = "Engine type like mysql,postgress"
}

variable "engine_version" {
  type = string
  description = "engine version"
}

variable "instance_class" {
  type = string
  description = "Instance class"
}

variable "identifier" {
  type = string
  description = "DB identifier name"
}

variable "vpc_security_group_ids" {
  type = list(string)
  description = "Securiry group of DB"
}

variable "db_subnet_group_name" {
  type = string
  description = "DB subnet name"
}

variable "publicly_accessible" {
  type = string
}

variable "skip_final_snapshot" {
  type = string
}

variable "port" {
  type = number
  description = "port number of DB"
}

variable "final_snapshot_identifier" {
  type = string
}
