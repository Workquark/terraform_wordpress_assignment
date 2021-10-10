terraform {
  backend "s3" {
    bucket = "wordpress-assignment2021"
    key    = "path/to/my/key"
    region = "ap-south-1"

    # workspaces {
    #   name = terraform.workspace
    # }
  }
}

