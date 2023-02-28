name        = "tfm-validate-gh-action"
description = "GitHub Action to perform terraform validate"

branch_protection = {
  strict      = true
  checks_list = ["conventional-commits", "documentation"]
}
