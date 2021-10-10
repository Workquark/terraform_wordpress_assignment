locals {
  environment = terraform.workspace == "default" ? "default" : title(terraform.workspace)
  name        = "${local.environment}-${var.app}"

  database = var.database
  tags = {
    organization = "assignment"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.name}-EKS" = "shared"
    "kubernetes.io/role/elb"                  = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.name}-EKS" = "shared"
    "kubernetes.io/role/internal-elb"         = "1"
  }

  node_group_additional_tags = {
    ExtraTag = "example"
  }
}

