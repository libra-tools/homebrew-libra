#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE' >&2
Usage: scripts/update-formula.sh <tag> <darwin-arm64-sha256> <linux-amd64-sha256> <linux-arm64-sha256>

Example:
  scripts/update-formula.sh v0.17.1446 \
    <sha256-for-libra-darwin-arm64> \
    <sha256-for-libra-linux-amd64> \
    <sha256-for-libra-linux-arm64>
USAGE
}

if [[ $# -ne 4 ]]; then
  usage
  exit 2
fi

tag="$1"
version="${tag#v}"
darwin_arm64_sha="$2"
linux_amd64_sha="$3"
linux_arm64_sha="$4"
formula_path="${FORMULA_PATH:-Formula/libra.rb}"

if [[ "$tag" != v* ]]; then
  echo "error: tag must start with v, got: $tag" >&2
  exit 2
fi

for sha in "$darwin_arm64_sha" "$linux_amd64_sha" "$linux_arm64_sha"; do
  if [[ ! "$sha" =~ ^[0-9a-f]{64}$ ]]; then
    echo "error: sha256 must be 64 lowercase hex characters, got: $sha" >&2
    exit 2
  fi
done

if [[ ! -f "$formula_path" ]]; then
  echo "error: formula not found: $formula_path" >&2
  exit 2
fi

tmpfile="$(mktemp)"
trap 'rm -f "$tmpfile"' EXIT

awk \
  -v version="$version" \
  -v tag="$tag" \
  -v darwin_arm64_sha="$darwin_arm64_sha" \
  -v linux_amd64_sha="$linux_amd64_sha" \
  -v linux_arm64_sha="$linux_arm64_sha" '
    /version "/ {
      sub(/version "[^"]+"/, "version \"" version "\"")
    }
    /libra-darwin-arm64"/ {
      sub(/https:\/\/github.com\/libra-tools\/libra\/releases\/download\/[^\/]+\/libra-darwin-arm64|https:\/\/download\.libra\.tools\/libra\/releases\/[^\/]+\/libra-darwin-arm64/, "https://download.libra.tools/libra/releases/" tag "/libra-darwin-arm64")
      platform = "darwin-arm64"
    }
    /libra-linux-amd64"/ {
      sub(/https:\/\/github.com\/libra-tools\/libra\/releases\/download\/[^\/]+\/libra-linux-amd64|https:\/\/download\.libra\.tools\/libra\/releases\/[^\/]+\/libra-linux-amd64/, "https://download.libra.tools/libra/releases/" tag "/libra-linux-amd64")
      platform = "linux-amd64"
    }
    /libra-linux-arm64"/ {
      sub(/https:\/\/github.com\/libra-tools\/libra\/releases\/download\/[^\/]+\/libra-linux-arm64|https:\/\/download\.libra\.tools\/libra\/releases\/[^\/]+\/libra-linux-arm64/, "https://download.libra.tools/libra/releases/" tag "/libra-linux-arm64")
      platform = "linux-arm64"
    }
    /sha256 "/ {
      if (platform == "darwin-arm64") {
        sub(/sha256 "[^"]+"/, "sha256 \"" darwin_arm64_sha "\"")
        platform = ""
      } else if (platform == "linux-amd64") {
        sub(/sha256 "[^"]+"/, "sha256 \"" linux_amd64_sha "\"")
        platform = ""
      } else if (platform == "linux-arm64") {
        sub(/sha256 "[^"]+"/, "sha256 \"" linux_arm64_sha "\"")
        platform = ""
      }
    }
    { print }
  ' "$formula_path" > "$tmpfile"

mv "$tmpfile" "$formula_path"
trap - EXIT
