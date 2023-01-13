resource "github_repository" "default" {

  name        = var.name
  description = var.description
  visibility  = var.visibility

  has_downloads = var.has_downloads
  has_issues    = var.has_issues
  has_projects  = var.has_projects
  has_wiki      = var.has_wiki

  allow_merge_commit = var.allow_merge_commit
  allow_rebase_merge = var.allow_rebase_merge
  allow_squash_merge = var.allow_squash_merge
  allow_auto_merge   = var.allow_auto_merge

  # VULNERABILITY ALERTS ARE NOT ACCESSIBLE BY PAT - GithubApp needs to be used
  # vulnerability_alerts = var.vulnerability_alerts 

  delete_branch_on_merge = var.delete_branch_on_merge
  archive_on_destroy     = var.archive_on_destroy

  auto_init = true
}
