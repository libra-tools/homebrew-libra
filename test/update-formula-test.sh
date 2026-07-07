#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

formula="$tmpdir/libra.rb"
cp "$repo_root/Formula/libra.rb" "$formula"

FORMULA_PATH="$formula" "$repo_root/scripts/update-formula.sh" \
  v0.17.1446 \
  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa \
  bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb \
  cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

grep -Fq 'version "0.17.1446"' "$formula"
grep -Fq 'https://download.libra.tools/libra/releases/v0.17.1446/libra-darwin-arm64' "$formula"
grep -Fq 'sha256 "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' "$formula"
grep -Fq 'https://download.libra.tools/libra/releases/v0.17.1446/libra-linux-amd64' "$formula"
grep -Fq 'sha256 "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"' "$formula"
grep -Fq 'https://download.libra.tools/libra/releases/v0.17.1446/libra-linux-arm64' "$formula"
grep -Fq 'sha256 "cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"' "$formula"
