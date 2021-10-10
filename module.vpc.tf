
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.47"

  name                 = "${local.name}-vpc"
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  database_subnets     = var.database_subnets
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames

  public_subnet_tags  = merge(local.tags, local.public_subnet_tags)
  private_subnet_tags = merge(local.tags, local.private_subnet_tags)
}
