# GitHub Teams Example: DevOps Monolithic Setup

This example demonstrates how to manage a monolithic setup of GitHub teams using a single Terraform module.

## Overview

### Core Team

- **Name**: `devops-core`
- **Description**: Central DevOps team responsible for managing all infrastructure and processes.
- **Roles**:
  - Maintainers: `admin_user1`
  - Members: `admin_user2`

> **Note**: All usernames specified in the roles **must be valid GitHub users**.

### Sub-Teams

| Team Name               | Description                                | Parent Team       | Maintainers          | Members                       |
|-------------------------|--------------------------------------------|-------------------|----------------------|-------------------------------|
| `devops-infrastructure` | Manages cloud resources                    | `devops-core`     | `infra_user1`        | `infra_user2, infra_user3`    |
| `devops-cicd`           | Manages CI/CD pipelines and automation     | `devops-core`     | `cicd_user1`         | `cicd_user2`                 |
| `devops-monitoring`     | Ensures system health and security         | `devops-core`     | `monitoring_user1`   | `monitoring_user2`           |
| `devops-docs`           | Maintains DevOps processes documentation   | `devops-core`     | `docs_user1`         | `docs_user2`                 |
| `devops-release`        | Oversees releases and deployments          | `devops-core`     | `release_user1`      | `release_user2`              |

## Features

- **Parent-Child Hierarchy**: Sub-teams are linked to the core team using `parent_team_id`.
- **Team Privacy**: All teams are configured as `closed` to restrict access.
- **Default Maintainers**: Automatically adds a default maintainer for teams where `create_default_maintainer` is enabled.
- **Flexible Role Assignments**: Maintainers and members are explicitly defined for each team.

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/your-repo-path.git
    cd examples/github-teams
    ```

2. Initialize and apply:

    ```bash
    terraform init
    terraform apply
    ```

3. Customize variables in `main.tf` to match your organization's requirements.

## Notes

- Ensure all `username` entries in the `roles` list are valid GitHub users.
- Use `parent_team_id` to establish the hierarchy between teams.
- Adjust team descriptions and settings to align with your DevOps practices.
