<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 4.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 4.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection.protect_main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_file.cd_gh_action](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.ci_gh_action](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.codeowners_file](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.workflow_files](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.workflow_ruled](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_cd_workflow"></a> [add\_cd\_workflow](#input\_add\_cd\_workflow) | Add cd.yml with the pixle-systems/generate-version-and-release-notes-gh-action step | `any` | <pre>{<br>  "semver": false,<br>  "tf_docs": false,<br>  "tf_folder": "./"<br>}</pre> | no |
| <a name="input_add_ci_workflow"></a> [add\_ci\_workflow](#input\_add\_ci\_workflow) | Add ci.yml with the checks: conventional-commits, jira-tickets-commits and documentation | `any` | <pre>{<br>  "ensure_conventional_commits": false,<br>  "ensure_documentation": false,<br>  "ensure_jira_tickets": false,<br>  "terraform": {<br>    "tf_folder": "./",<br>    "tf_validate_iac": false,<br>    "tf_validate_security": false<br>  }<br>}</pre> | no |
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | n/a | `bool` | `false` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | only allow squash merge enable by default because it is the only accepted by the release gh action | `bool` | `false` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | n/a | `bool` | `false` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | n/a | `bool` | `true` | no |
| <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy) | n/a | `bool` | `true` | no |
| <a name="input_branch_protection"></a> [branch\_protection](#input\_branch\_protection) | n/a | <pre>object({<br>    strict      = bool<br>    checks_list = list(string)<br>  })</pre> | <pre>{<br>  "checks_list": [],<br>  "strict": true<br>}</pre> | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | n/a | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | repository description | `string` | n/a | yes |
| <a name="input_has_downloads"></a> [has\_downloads](#input\_has\_downloads) | n/a | `bool` | `false` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | n/a | `bool` | `false` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | n/a | `bool` | `false` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | n/a | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | repository name | `string` | n/a | yes |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | n/a | `string` | `"public"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | n/a | `bool` | `true` | no |
| <a name="input_workflows"></a> [workflows](#input\_workflows) | Add workflows based on templates | `any` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->