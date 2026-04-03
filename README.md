# Homebrew Tap

Homebrew tap for my personal projects.

Eligible public formulas are refreshed automatically from upstream `main` snapshots, so `brew upgrade` can pick up recent commits even before a tagged release exists. Casks are updated from GitHub releases on the same schedule.

## Installation

```bash
brew tap nclandrei/tap

# Install a formula (CLI tool)
brew install nclandrei/tap/<formula>

# Install a cask (macOS app)
brew install --cask nclandrei/tap/<cask>
```

## Available Casks

| Cask | Description |
|------|-------------|
| cicero | AI-native macOS presentation app for developers |
| reaper | macOS menu bar process killer with one-click quit |
| turnshare | macOS menu bar app for sharing AI coding sessions via GitHub Gists |

## Available Formulas

| Formula | Description |
|---------|-------------|
| claude-statusline | Minimal statusline renderer for Claude Code |
| distill | CLI tool that monitors AI agent sessions, identifies patterns, and proposes skills |
| magellan | Deterministic presentation engine for AI-generated technical walkthroughs |
| mcpsmith | Convert MCP servers into source-grounded skill packs with staged review and verify steps |
| planwarden | CLI planning enforcer for AI agents |
| proctor | Manual verification contract CLI that forces coding agents to prove they manually tested their own work |
| screenforge | CLI tool for generating App Store-style marketing screenshots |
| teller | AI-powered financial assistant for managing documents and transactions |
