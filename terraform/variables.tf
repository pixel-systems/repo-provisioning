variable "name" {
  type        = string
  description = "repository name"
}

variable "description" {
  type        = string
  description = "repository description"
}

variable "visibility" {
  type    = string
  default = "public"

  validation {
    condition     = var.visibility == "public" || var.visibility == "private"
    error_message = "The repo visibility must be public or private."
  }
}

variable "has_downloads" {
  type    = bool
  default = false
}

variable "has_issues" {
  type    = bool
  default = false
}

variable "has_projects" {
  type    = bool
  default = false
}

variable "has_wiki" {
  type    = bool
  default = false
}

# only allow squash merge enable by default 
# because it is the only accepted by the release gh action
variable "allow_merge_commit" {
  type    = bool
  default = false
}

variable "allow_rebase_merge" {
  type    = bool
  default = false
}

variable "allow_squash_merge" {
  type    = bool
  default = true
}

variable "allow_auto_merge" {
  type    = bool
  default = false
}

variable "vulnerability_alerts" {
  type    = bool
  default = true
}

variable "delete_branch_on_merge" {
  type    = bool
  default = true
}

variable "archive_on_destroy" {
  type    = bool
  default = true
}

variable "branch_protection" {
  type = object({
    strict      = bool
    checks_list = list(string)
  })
  default = {
    strict      = true
    checks_list = []
  }
}

variable "add_cd_workflow" {
  description = "Add cd.yml with the pixle-systems/generate-version-and-release-notes-gh-action step"
  type        = any
  default = {
    tf_folder = "./"
    semver    = false
    tf_docs   = false
  }
}

variable "add_ci_workflow" {
  description = "Add ci.yml with the checks: conventional-commits, jira-tickets-commits and documentation"
  type        = any
  default = {
    ensure_conventional_commits = false
    ensure_jira_tickets         = false
    ensure_documentation        = false
    terraform = {
      tf_folder            = "./"
      tf_validate_security = false
      tf_validate_iac      = false
    }
  }
}

variable "workflows" {
  description = "Add workflows based on templates"
  type        = any
  default     = {}
}