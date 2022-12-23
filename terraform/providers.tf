provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = local.default_tags
  }
}


provider "github" {
  owner = "pixel-systems"
  # token= GITHUB_TOKEN
}
