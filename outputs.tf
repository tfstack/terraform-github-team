output "ids" {
  value = [for team in github_team.this : team.id]
}

output "node_ids" {
  value = [for team in github_team.this : team.node_id]
}

output "slugs" {
  value = [for team in github_team.this : team.slug]
}
