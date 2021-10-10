variable "database" {
  type = object({
    engine               = string
    engine_version       = string
    family               = string
    major_engine_version = string
    instance_class       = string
  })
}
variable "name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "database_subnets" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "tags" {
  type        = map(string)
  description = "(optional) describe your variable"
}

