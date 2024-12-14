# GitHub Teams Example: DevOps Modular Setup

This example demonstrates how to create a modular hierarchy of GitHub teams using the `tfstack/team/github` Terraform module.

## Overview

### Core Team

- **Name**: `devops-core`
- **Description**: Central DevOps team managing all infrastructure and processes.
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

- **Parent-Child Hierarchy**: `parent_team_id` links sub-teams to the core team.
- **Team Privacy**: All teams are `closed` to ensure security.
- **Role Assignments**: Explicit maintainers and members for each team.

## Usage

1. Clone the example directory:

    ```bash
    git clone https://github.com/tfstack/team-modules.git
    cd examples/devops-teams
    ```

2. Initialize and apply:

    ```bash
    terraform init
    terraform apply
    ```

3. Customize variables in `main.tf` as needed.
