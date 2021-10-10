variable "region" {
  type        = string
  description = "(optional) describe your variable"
}

variable "vpc_cidr" {
  type        = string
  description = "(optional) describe your variable"
}

# variable "environment" {
#   type        = string
#   description = "(optional) describe your variable"
# }

variable "tags" {
  type        = map(string)
  description = "(optional) describe your variable"
}

# variable "database" {
#   type        = string
#   description = "(optional) describe your variable"
# }

variable "app" {
  type        = string
  description = "(optional) describe your variable"
}


variable "public_subnets" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "private_subnets" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "database_subnets" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "single_nat_gateway" {
  type        = bool
  description = "(optional) describe your variable"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "(optional) describe your variable"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "(optional) describe your variable"
}

variable "ami_type" {
  type        = string
  description = "(optional) describe your variable"
}

variable "disk_size" {
  type        = string
  description = "(optional) describe your variable"
}

variable "desired_capacity" {
  type        = number
  description = "(optional) describe your variable"
}

variable "max_capacity" {
  type        = number
  description = "(optional) describe your variable"
}

variable "min_capacity" {
  type        = number
  description = "(optional) describe your variable"
}

variable "instance_types" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "capacity_type" {
  type        = string
  description = "(optional) describe your variable"
}


variable "database" {
  type = object({
    engine               = string
    engine_version       = string
    family               = string
    major_engine_version = string
    instance_class       = string
  })
}

