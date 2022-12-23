locals {
  commit_details = {
    author = "pixelsystems-github-svc"
    email  = "jozef.cajkovic@gmail.com"
  }

  default_tags = {
    Iac          = "terraform"
    IacRepo      = "https://github.com/pixelsystems/repo-provisioning"
    Team         = "devops"
    Stage        = "prd"
    Service      = "repo-provisioning"
    ServiceGroup = "cicd"
  }
}
