module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = lower(local.name)

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = var.name
  engine_version       = var.database.engine_version
  family               = var.database.family               # DB parameter group
  major_engine_version = var.database.major_engine_version # DB option group
  instance_class       = var.database.instance_class

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_encrypted     = false

  name     = "wordpressmysql"
  username = "wordpress"
  password = "mypassword123"
  port     = 3306

  multi_az               = true
  subnet_ids             = var.database_subnets
  vpc_security_group_ids = var.vpc_security_group_ids

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["general"]

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  tags = var.tags
  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}
