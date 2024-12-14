# terraform-github-team

Terraform module to manage GitHub Team

## Set GitHub token

export GITHUB_TOKEN=ghp_xxx

### Required permission

[] repo
[] admin:org:write:org
[] delete_repo

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 6.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 6.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_team.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team_membership.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | The GitHub user or organization that owns the team. | `string` | `null` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | A list of team configurations. | <pre>list(object({<br/>    name                      = string<br/>    description               = optional(string, null)<br/>    privacy                   = optional(string, "secret")<br/>    parent_team_id            = optional(string, null)<br/>    ldap_dn                   = optional(string, null)<br/>    create_default_maintainer = optional(bool, false)<br/>    roles = optional(list(object({<br/>      username = string<br/>      role     = optional(string, "member")<br/>    })), [])<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | n/a |
| <a name="output_node_ids"></a> [node\_ids](#output\_node\_ids) | n/a |
| <a name="output_slugs"></a> [slugs](#output\_slugs) | n/a |
