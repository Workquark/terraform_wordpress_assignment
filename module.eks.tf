module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${local.name}-EKS"
  cluster_version = "1.21"
  subnets         = module.vpc.private_subnets

  tags = var.tags

  vpc_id = module.vpc.vpc_id

  node_groups_defaults = {
    ami_type  = var.ami_type,
    disk_size = var.disk_size,
  }

  node_groups = {
    MANAGED_NODES_GROUP = {
      name             = " ${upper(local.name)}-NODE-GROUP"
      subnets          = module.vpc.private_subnets
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity
      min_capacity     = var.min_capacity

      instance_types  = var.instance_types
      capacity_type   = var.capacity_type
      k8s_labels      = var.tags
      additional_tags = local.node_group_additional_tags

      # taints = [
      #   {
      #     key    = "dedicated"
      #     value  = "gpuGroup"
      #     effect = "NO_SCHEDULE"
      #   }
      # ]
      update_config = {
        max_unavailable_percentage = 50 # or set `max_unavailable`
      }
    }
  }

  #   map_roles    = var.map_roles
  #   map_users    = var.map_users
  #   map_accounts = var.map_accounts
}
# provider "helm" {
#   kubernetes {
#     host                   = module.eks.helmconfig.host
#     token                  = module.eks.helmconfig.token
#     cluster_ca_certificate = base64decode(module.eks.helmconfig.ca)
#     load_config_file       = false
#   }
# }

# module "metrics-server" {
#   source       = "Young-ook/eks/aws//modules/metrics-server"
#   cluster_name = module.eks.cluster.name
#   oidc         = module.eks.oidc
#   tags         = local.tags
# }  
