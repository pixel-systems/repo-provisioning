# repo-provisioning

# User Cases:

## Create a new GH action repo

1. Create a branch from `main`
2. Create a folder in `./repos` named as the repo you want to create
3. Add a  `backend.tfvars` file containing the terraform state file you want to be created. Example `key = "create-dotnet-lambda-artifact-gh-action.tfstate"`
4. Add a `resources.tfvars` with the settings you want for the repo. The required ones are next.
   1. `name`: value to your repo name
   2. `description`: description for the repo
5. Create a PR to `main`, request approvals, merge
   
## Update a GH action repo

1. Create a branch from `main`
2. Update the `resources.tfvars` with the new settings you need
3. Create a PR,  request approvals, merge

## Update all GH actions repos

* Any change in the terraform folder merged to `main` will trigger a terraform apply on all the repositories

# Available repository settings 

The available settings are listed in the terraform variables here:

[terraform docs](terraform/README.md#inputs)

# Some tips

## Create repos with CI and CD steps out-of-the-box
* You can create repositories with the next checks
  * ci.yml: set of checks to ensure
    * Commits follow Conventional conventions as `fix, break, feat`
    * Commits contain a JIRA ticket
    * Documentation: ensure any PR should modify the readme
  * cd.yml:
    * generate-version-and-release-notes-gh-action: if you follow conventional commits this check will take care of versioning your repo and update the CHANGELOG and

You can check how those ci.yml/cd.yml looks like in the folder 'terraform/assets/workflows'

The required tfvars input is:
```tf
add_cd_workflow = {
  semver = true
}
add_ci_workflow = {
   ensure_conventional_commits = true
   ensure_jira_tickets         = true
   ensure_documentation        = true
}
```

And if you want them to be required in PRs you can update the branch protection as next:
```tf
branch_protection = {
  strict = true
  checks_list = [
    "conventional-commits",
    "jira-tickets-commits",
    "documentation",
  ]
}
```