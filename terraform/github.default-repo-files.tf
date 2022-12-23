resource "github_repository_file" "codeowners_file" {
  repository          = github_repository.default.name
  commit_message      = "[skip ci] Adding CODEOWNERS file - Managed by Terraform"
  commit_author       = "pixel-systems-github-svc"
  commit_email        = "github-svc@pixelsystems.sk"
  branch              = local.default_branch
  file                = "CODEOWNERS"
  # content             = "* @pixel-systems/${data.github_team.devops.name}"
  content             = "* @pixel-systems/devops"
  overwrite_on_create = true

  depends_on = [
    github_repository.default
  ]
}
