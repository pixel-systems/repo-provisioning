locals {
  workflow_list = { for workflow_name, workflow_props in var.workflows : workflow_name =>
    {
      workflow_id          = workflow_props.workflow_id
      workflow_name        = workflow_name
      workflow_title       = try(workflow_props.workflow_title, workflow_name)
      template             = workflow_props.template
      repo_file_name       = workflow_props.repo_file_name
      commit_msg           = try(workflow_props.commit_msg, "[skip ci] adding ${workflow_props.repo_file_name} - Pushed by product-provisioning repository")
      inputs               = merge(lookup(local.workflow_id_vs_default_values, workflow_props.workflow_id, {}), try(workflow_props.inputs, {}))
      triggers             = try(workflow_props.triggers, lookup(local.workflow_id_vs_default_triggers, workflow_props.workflow_id, {}))
      overwrite_on_create  = try(workflow_props.overwrite_on_create, false)
      overwrite_on_changes = try(workflow_props.overwrite_on_changes, false)
    }
  }

  workflows_filled = { for k, v in local.workflow_list : k => merge(v, {
    content = templatefile("${path.module}/${v.template}", v)
    })
  }
}

resource "github_repository_file" "workflow_files" {
  for_each            = { for k, v in local.workflows_filled : k => v if !v.overwrite_on_changes }
  repository          = var.name
  commit_message      = each.value.commit_msg
  commit_author       = local.commit_details.author
  commit_email        = local.commit_details.email
  branch              = local.default_branch
  file                = ".github/workflows/${each.value.repo_file_name}"
  content             = each.value.content
  overwrite_on_create = each.value.overwrite_on_create
  depends_on = [
    github_repository.default,
    github_branch_default.default
  ]

  # this will prevent overwrite manual modifications on the file content done by the teams
  lifecycle {
    ignore_changes = [
      content
    ]
  }
}

resource "github_repository_file" "workflow_ruled" {
  for_each            = { for k, v in local.workflows_filled : k => v if v.overwrite_on_changes }
  repository          = var.name
  commit_message      = each.value.commit_msg
  commit_author       = local.commit_details.author
  commit_email        = local.commit_details.email
  branch              = local.default_branch
  file                = ".github/workflows/${each.value.repo_file_name}"
  content             = each.value.content
  overwrite_on_create = each.value.overwrite_on_create
  depends_on = [
    github_repository.default,
    github_branch_default.default
  ]
}
