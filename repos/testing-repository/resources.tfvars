name        = "testing-repository"
description = "testing repository for repository provisioning"

branch_protection = {
  strict      = true
  # checks_list = ["conventional-commits", "documentation", "jira-tickets-commits"]
  checks_list = ["conventional-commits", "documentation"]
}
