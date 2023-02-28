name        = "ensure-commits-have-ticket-gh-action"
description = "GitHub Action to perform check on commit messages if they are configured based to rules of Pixel Systems organization"

branch_protection = {
  strict      = true
  checks_list = ["conventional-commits", "documentation"]
}
