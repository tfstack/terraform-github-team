module "github_team" {
  source = "../.."

  github_owner = "your-organization-name"

  teams = [
    {
      name                      = "devops-core"
      description               = "Core DevOps team responsible for infrastructure"
      privacy                   = "closed"
      create_default_maintainer = true
      roles = [
        # username should be a valid github user
        { username = "admin_user1", role = "maintainer" },
        { username = "admin_user2", role = "member" }
      ]
    },
    {
      name           = "devops-infrastructure"
      description    = "Infrastructure team managing cloud resources"
      privacy        = "closed"
      parent_team_id = "devops-core" # Parent team is the Core DevOps team
      # ldap_dn                   = "" # Optional LDAP integration
      create_default_maintainer = true
      roles = [
        # username should be a valid github user
        { username = "infra_user1", role = "maintainer" },
        { username = "infra_user2", role = "member" },
        { username = "infra_user3", role = "member" }
      ]
    },
    {
      name           = "devops-cicd"
      description    = "CI/CD team managing pipelines and automation"
      privacy        = "closed"
      parent_team_id = "devops-core" # Parent team is the Core DevOps team
      # ldap_dn                   = "" # Optional LDAP integration
      create_default_maintainer = false
      roles = [
        # username should be a valid github user
        { username = "cicd_user1", role = "maintainer" },
        { username = "cicd_user2", role = "member" }
      ]
    },
    {
      name           = "devops-monitoring"
      description    = "Monitoring team responsible for system health and security"
      privacy        = "closed"
      parent_team_id = "devops-core" # Parent team is the Core DevOps team
      # ldap_dn                   = "" # Optional LDAP integration
      create_default_maintainer = false
      roles = [
        # username should be a valid github user
        { username = "monitoring_user1", role = "maintainer" },
        { username = "monitoring_user2", role = "member" }
      ]
    },
    {
      name           = "devops-docs"
      description    = "Documentation team for DevOps processes and procedures"
      privacy        = "closed"
      parent_team_id = "devops-core" # Parent team is the Core DevOps team
      # ldap_dn                   = "" # Optional LDAP integration
      create_default_maintainer = true
      roles = [
        # username should be a valid github user
        { username = "docs_user1", role = "maintainer" },
        { username = "docs_user2", role = "member" }
      ]
    },
    {
      name           = "devops-release"
      description    = "Release management team for versioning and deployments"
      privacy        = "closed"
      parent_team_id = "devops-core" # Parent team is the Core DevOps team
      # ldap_dn                   = "" # Optional LDAP integration
      create_default_maintainer = false
      roles = [
        # username should be a valid github user
        { username = "release_user1", role = "maintainer" },
        { username = "release_user2", role = "member" }
      ]
    }
  ]
}
