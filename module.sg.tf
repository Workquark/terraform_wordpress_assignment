
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}


#############################################################
# Security group which is used as an argument in complete-sg
#############################################################
module "main_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "main-sg"
  description = "Security group which is used as an argument in complete-sg"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.private_subnets
  ingress_rules       = ["mysql-tcp"]
}
