locals {

  tf_validate_iac_content = replace(
    file("${path.module}/assets/workflows/ci-tf-validate-iac.yml"),
    "TERRAFORM_FOLDER_PLACEHOLDER",
  try(var.add_ci_workflow.terraform.tf_folder, "./"))

  ci_yml_parts = [
    {
      "name" : "header",
      "content" : file("${path.module}/assets/workflows/ci-header.yml"),
      "use" : true
    },
    {
      "name" : "ensure_cc",
      "content" : file("${path.module}/assets/workflows/ci-ensure-conventional-commits.yml"),
      "use" : try(var.add_ci_workflow.ensure_conventional_commits, false)
    },
    {
      "name" : "ensure_jira_tickets",
      "content" : file("${path.module}/assets/workflows/ci-ensure-jira-tickets.yml"),
      "use" : try(var.add_ci_workflow.ensure_jira_tickets, false)
    },
    {
      "name" : "ensure_documentation",
      "content" : file("${path.module}/assets/workflows/ci-ensure-documentation.yml"),
      "use" : try(var.add_ci_workflow.ensure_documentation, false)
    },
    {
      "name" : "tf_validate_security",
      "content" : file("${path.module}/assets/workflows/ci-tf-validate-security.yml"),
      "use" : try(var.add_ci_workflow.terraform.tf_validate_security, false)
    },
    {
      "name" : "tf_validate_iac",
      "content" : local.tf_validate_iac_content,
      "use" : try(var.add_ci_workflow.terraform.tf_validate_iac, false)
    }
  ]

  ci_yml_parts_filtered  = [for p in local.ci_yml_parts : p.content if p.use]
  ci_yml_content         = join("\n", local.ci_yml_parts_filtered)
  ci_yml_must_be_created = contains(values(var.add_ci_workflow), true)

}

resource "github_repository_file" "ci_gh_action" {
  count = local.ci_yml_must_be_created ? 1 : 0

  repository          = github_repository.default.name
  commit_message      = "[skip ci] Adding ci.yml - Managed by Terraform"
  commit_author       = "pixel-systems-github-svc"
  commit_email        = "github-svc@pixelsystems.sk"
  branch              = local.default_branch
  file                = ".github/workflows/ci.yml"
  content             = local.ci_yml_content
  overwrite_on_create = false

  depends_on = [
    github_repository.default,
    github_branch_default.default
  ]

  # this will prevent overwrite manual modifications to the content of the file done by the teams
  lifecycle {
    ignore_changes = [
      content
    ]
  }
}
