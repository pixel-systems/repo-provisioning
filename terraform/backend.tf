terraform {
  cloud {
    organization = "pixel-systems"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "pixel-systems-gh-repositories"
    }

  }
}
