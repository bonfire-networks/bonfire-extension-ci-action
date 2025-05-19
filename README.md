# Bonfire Extension CI Action

GitHub Action for building and testing Bonfire extensions, with support for automated Transifex translations updates.

## Features

- Testing and linting for Bonfire extensions
- Translation extraction and synchronization with Transifex
- Automatic PR creation for updated translations

## Usage

Add this to your GitHub workflow file:

```yaml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

permissions:
  contents: write # Needed for pushing translation branches
  pull-requests: write # Needed for creating PRs

jobs:
  test:
    runs-on: ubuntu-latest
    name: Build and test
    steps:
      - uses: bonfire-networks/bonfire-extension-ci-action@main
        with:
          tx-token: ${{ secrets.TX_TOKEN }}
```

## Configuration

| Input | Description | Required | Default |
| ----- | ----------- | -------- | ------- |
| `db-startup-time` | The number of seconds CI will wait before expecting the Postgres db to be running | No | `10` |
| `tx-token` | Transifex API token | No | `''` |
| `github-token` | GitHub token with permission to create branches and PRs | No | Uses `github.token` |

## Permissions Required

To enable automatic PR creation for translations, you need to grant write permissions to the GITHUB_TOKEN. Add this to your workflow file:

```yaml
permissions:
  contents: write
  pull-requests: write
```

## Translation Updates

When configured with a Transifex token, this action will:

1. Extract translations from your project
2. Push source strings to Transifex
3. Pull latest translations
4. Create or update a PR with the changes (if any)

The PR will be created on the `update_translations` branch.
