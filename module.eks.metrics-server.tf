# module "eks" {
#   source                     = "Young-ook/eks/aws"
#   name                       = "eks"
# }

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
