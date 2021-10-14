data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "aws_availability_zones" "available" {}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

# module "rds" {
#   source                 = "./modules/rds"
#   name                   = local.name
#   database               = var.database
#   database_subnets       = module.vpc.database_subnets
#   vpc_security_group_ids = [module.main_sg.security_group_id]
#   tags                   = local.tags
# }

