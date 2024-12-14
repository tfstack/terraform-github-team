run "setup" {
  module {
    source = "./tests/setup"
  }
}

# Run setup to create a GitHub repository
run "setup_github_team" {
  variables {
    github_owner = "jdevto"

    teams = [
      {
        name                      = "devops-core-${run.setup.suffix}"
        description               = "Core DevOps team responsible for infrastructure"
        privacy                   = "closed"
        create_default_maintainer = true
      }
    ]
  }

  # Assert that the team name matches the expected team name
  assert {
    condition     = github_team.this[0].name == "devops-core-${run.setup.suffix}"
    error_message = "GitHub team name does not match 'devops-core-${run.setup.suffix}'"
  }

  # Assert that the description matches the expected description
  assert {
    condition     = github_team.this[0].description == "Core DevOps team responsible for infrastructure"
    error_message = "GitHub team description does not match the expected description"
  }

  # Assert that the team privacy is 'closed'
  assert {
    condition     = github_team.this[0].privacy == "closed"
    error_message = "GitHub team privacy does not match the expected value of 'closed'"
  }
}
