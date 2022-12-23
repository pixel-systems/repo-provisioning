name        = "testing-repository"
description = "description_to_be_fill"

branch_protection = {
  strict      = true
  checks_list = ["conventional-commits", "documentation", "jira-tickets-commits"]
}
