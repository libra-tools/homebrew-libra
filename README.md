# Homebrew Tap for Libra

This repository is a Homebrew tap for
[Libra](https://github.com/libra-tools/libra), an AI agent-native
version control system with Git on-disk compatibility.

## Install

```bash
brew tap libra-tools/libra
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
brew untap libra-tools/libra
```

## Formula

The formula installs prebuilt Libra binaries from
`https://github.com/libra-tools/libra/releases` and verifies the published
SHA-256 digest for each supported platform.

## Install Older Versions

This tap keeps `Formula/libra.rb` pointed at the latest released Libra version.
To install an older version, install the formula from the tap commit that
updated Libra to that version:

```bash
brew install https://raw.githubusercontent.com/libra-tools/homebrew-libra/<commit-sha>/Formula/libra.rb
```

Find the commit for a version with:

```bash
git clone https://github.com/libra-tools/homebrew-libra.git
cd homebrew-libra
git log --oneline -- Formula/libra.rb
```

Release automation should use commit messages in this format so versions are
easy to find:

```text
Update libra to v0.17.1446
```

## Release Automation

The `libra` repository release workflow can update this tap after publishing
GitHub Release assets:

```bash
scripts/update-formula.sh \
  v0.17.1446 \
  <sha256-for-libra-darwin-arm64> \
  <sha256-for-libra-linux-amd64> \
  <sha256-for-libra-linux-arm64>
```

Then commit the result directly to this repository's `main` branch:

```bash
git add Formula/libra.rb
git commit -m "Update libra to v0.17.1446"
git push origin main
```

## Development

Run the local script test with:

```bash
bash test/update-formula-test.sh
```
