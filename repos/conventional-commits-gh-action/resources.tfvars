name        = "conventional-commits-gh-action"
description = "GitHub Action to perform check on commit messages if they are following conventional commits standard (https://www.conventionalcommits.org/)"

branch_protection = {
  strict      = true
  checks_list = ["conventional-commits", "documentation"]
}
