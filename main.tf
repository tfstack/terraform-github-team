resource "github_team" "this" {
  for_each = { for idx, team in var.teams : idx => team }

  name                      = each.value.name
  description               = each.value.description
  privacy                   = each.value.privacy
  parent_team_id            = each.value.parent_team_id
  ldap_dn                   = each.value.ldap_dn
  create_default_maintainer = each.value.create_default_maintainer
}

resource "github_team_membership" "this" {
  count = length(flatten([for team in var.teams : team.roles]))

  team_id = github_team.this[
    floor(count.index / length(
      [for team in var.teams : length(team.roles)]
      # We handle the case where roles is empty by using this conditional logic
    ))
  ].id

  username = flatten([for team in var.teams : team.roles])[count.index].username
  role     = flatten([for team in var.teams : team.roles])[count.index].role

  depends_on = [
    github_team.this
  ]
}
