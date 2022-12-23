locals {
  default_branch = "main"
}

resource "github_branch_default" "default" {
  repository = github_repository.default.name
  branch     = local.default_branch

  depends_on = [
    github_repository.default
  ]
}

resource "github_branch_protection" "protect_main" {

  repository_id = github_repository.default.id

  pattern                         = local.default_branch
  enforce_admins                  = false
  allows_deletions                = false
  require_conversation_resolution = true

  required_pull_request_reviews {
    restrict_dismissals             = false
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 2
  }

  required_status_checks {
    strict   = var.branch_protection.strict
    contexts = var.branch_protection.checks_list
  }

  depends_on = [
    github_branch_default.default
  ]
}
