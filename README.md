# Homebrew Tap for Libra

This repository is a Homebrew tap for
[Libra](https://github.com/web3infra-foundation/libra), an AI agent-native
version control system with Git on-disk compatibility.

## Install

```bash
brew tap fleeto/libra
brew install libra
libra --version
```

## Upgrade

```bash
brew update
brew upgrade libra
```

## Uninstall

```bash
brew uninstall libra
brew untap fleeto/libra
```

## Formula

The formula installs prebuilt Libra binaries from
`https://download.libra.tools/libra/releases/` and verifies the published
SHA-256 digest for each supported platform.
