name        = "generate-version-and-release-notes"
description = "GitHub Action to generate version and release notes based on commit messages"

branch_protection = {
  strict      = true
  checks_list = ["conventional-commits", "documentation"]
}
