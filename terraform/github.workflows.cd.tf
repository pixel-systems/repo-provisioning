locals {

  tf_docs_content = replace(
    file("${path.module}/assets/workflows/cd/tf_docs.yml"),
    "TERRAFORM_FOLDER_PLACEHOLDER",
  try(var.add_cd_workflow.terraform.tf_folder, "./"))

  cd_yml_parts = [
    {
      "name" : "header",
      "content" : file("${path.module}/assets/workflows/cd/header.yml"),
      "use" : true
    },
    {
      "name" : "semver",
      "content" : file("${path.module}/assets/workflows/cd/semver.yml"),
      "use" : try(var.add_cd_workflow.semver, false)
    },
    {
      "name" : "tf_docs",
      "content" : local.tf_docs_content,
      "use" : try(var.add_cd_workflow.terraform.tf_docs, false)
    }
  ]

  cd_yml_parts_filtered  = [for p in local.cd_yml_parts : p.content if p.use]
  cd_yml_content         = join("\n", local.cd_yml_parts_filtered)
  cd_yml_must_be_created = contains(values(var.add_cd_workflow), true)
}

resource "github_repository_file" "cd_gh_action" {
  count = local.cd_yml_must_be_created ? 1 : 0

  repository          = github_repository.default.name
  commit_message      = "[skip ci] Adding cd.yml - Managed by Terraform"
  commit_author       = "ohp-github-svc"
  commit_email        = "github-svc@ohpen.com"
  branch              = local.default_branch
  file                = ".github/workflows/cd.yml"
  content             = local.cd_yml_content
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
