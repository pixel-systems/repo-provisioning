# terraform {
#   cloud {
#     organization = "pixel-systems"
#     hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

#     workspaces {
#       name = "pixel-systems-gh-repositories"
#     }

#   }
# }

terraform {
  backend "s3" {
    bucket  = "terraform-state-311008325132" #core-cicd
    region  = "eu-west-1"
    encrypt = true

    # key =  # SPECIFIED AS INIT INPUT VARIABLE
  }
}