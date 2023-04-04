name        = "alb-security-policies-report"
description = "A tool to generate a report of the security policies of your ALBs"

branch_protection = {
  strict      = true
  checks_list = ["conventional-commits", "documentation"]
}
