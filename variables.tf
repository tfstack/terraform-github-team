variable "github_owner" {
  description = "The GitHub user or organization that owns the team."
  type        = string
  default     = null
}

variable "teams" {
  description = "A list of team configurations."
  type = list(object({
    name                      = string
    description               = optional(string, null)
    privacy                   = optional(string, "secret")
    parent_team_id            = optional(string, null)
    ldap_dn                   = optional(string, null)
    create_default_maintainer = optional(bool, false)
    roles = optional(list(object({
      username = string
      role     = optional(string, "member")
    })), [])
  }))
  default = []

  validation {
    condition = alltrue([
      for team in var.teams : alltrue([
        contains(["closed", "secret"], team.privacy)
      ])
    ])
    error_message = "Each privacy must be either 'closed' or 'secret'."
  }

  validation {
    condition = alltrue([
      for team in var.teams : alltrue([
        for role in team.roles :
        role.role == "member" || role.role == "maintainer"
      ])
    ])
    error_message = "Each role must be either 'member' or 'maintainer'."
  }
}
