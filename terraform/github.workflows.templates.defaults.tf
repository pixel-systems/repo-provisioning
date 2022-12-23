locals {
  workflow_id_vs_default_values = {
    delete_old_branches = {
      date                         = "5 minutes ago"
      dry_run                      = true
      delete_tags                  = false
      minimum_tags                 = 5
      extra_protected_branch_regex = "^(main|master|local|dev|test|tst|acc|prod|prd)$"
      extra_protected_tag_regex    = "^v.*"
      exclude_open_pr_branches     = true
    }
  }

  workflow_id_vs_default_triggers = {
    delete_old_branches = {
      workflow_dispatch = {}
      schedule = [
        "0 0 1,15 */1 *" # 00:00 day 1,15 every month
      ]
    }
  }
}
