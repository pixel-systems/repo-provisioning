name        = "tfm-plan-gh-action"
description = "GitHub Action to perform terraform plan with backend on S3 bucket"

branch_protection = {
  strict      = true
  checks_list = ["conventional-commits", "documentation"]
}
