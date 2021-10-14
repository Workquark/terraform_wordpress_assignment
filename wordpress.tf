# resource "kubernetes_deployment" "wordpress" {
#   metadata {
#     name = "wordpress"
#   }
#   spec {
#     replicas = 1
#     selector {
#       match_labels = {
#         env    = "production"
#         region = "IN"
#         app    = "wordpress"
#       }
#       match_expressions {
#         key      = "env"
#         operator = "In"
#         values   = ["production", "webserver"]
#       }
#     }
#     template {
#       metadata {
#         labels = {
#           env    = "production"
#           region = "IN"
#           app    = "wordpress"
#         }
#       }
#       spec {
#         container {
#           image = "wordpress"
#           name  = "wordpress"
#           env {
#             name  = "WORDPRESS_DB_HOST"
#             value = module.rds.db_instance_endpoint
#           }
#           env {
#             name  = "WORDPRESS_DB_USER"
#             value = module.rds.db_instance_username
#           }
#           env {
#             name  = "WORDPRESS_DB_PASSWORD"
#             value = module.rds.db_master_password
#           }
#           env {
#             name  = "WORDPRESS_DB_NAME"
#             value = module.rds.db_instance_name
#           }
#           env {
#             name  = "WORDPRESS_TABLE_PREFIX"
#             value = "wp_"
#           }
#           env {
#             name  = "WORDPRESS_DEBUG"
#             value = 1
#           }
#         }
#         # toleration {
#         #   effect   = "NoSchedule"
#         #   key      = "dedicated"
#         #   operator = "Equal"
#         #   value    = "gpuGroup"
#         # }
#       }
#     }
#   }
#   depends_on = [
#     module.eks.node_groups
#   ]
# }

# resource "kubernetes_service" "wordpresslb" {
#   metadata {
#     name = "wordpress"
#     annotations = {
#       "service.beta.kubernetes.io/aws-load-balancer-type" : "nlb"
#     }
#   }
#   spec {
#     selector = {
#       app = "wordpress"
#     }
#     port {
#       protocol    = "TCP"
#       port        = 80
#       target_port = 80
#     }
#     type = "LoadBalancer"
#   }
# }

# resource "kubernetes_horizontal_pod_autoscaler" "wordpress-hpa" {
#   metadata {
#     name = "wordpress-hpa"
#   }
#   spec {
#     max_replicas                      = 3
#     min_replicas                      = 2
#     target_cpu_utilization_percentage = 70
#     scale_target_ref {
#       kind = "Deployment"
#       name = "wordpress"
#     }
#   }
# }
