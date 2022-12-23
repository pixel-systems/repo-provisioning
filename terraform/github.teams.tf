# data "github_team" "devops" {
#   slug = "devops"
# }

# data "github_team" "devs" {
#   slug = "devs"
# }

# resource "github_team_repository" "admins_team" {
#   team_id    = data.github_team.devops.id
#   repository = github_repository.default.name
#   permission = "admin"

#   depends_on = [github_repository.default]
# }

# resource "github_team_repository" "developers" {
#   team_id    = data.github_team.devs.id
#   repository = github_repository.default.name
#   permission = "push"

#   depends_on = [github_repository.default]
# }
