terraform {

  required_version = "~>1.0" #reflects version in .terraform-version file

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.19.0"
    }
  }
}
