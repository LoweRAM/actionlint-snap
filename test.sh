#!/bin/bash
# Basic tests for the actionlint snap.

set -euo pipefail

export PATH="/snap/bin:$PATH"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "::group::Check actionlint version"
actionlint --version
echo "::endgroup::"

echo "::group::Lint repo workflows"
actionlint
echo "::endgroup::"

echo "::group::Lint valid workflows in test-data/valid"
actionlint test-data/valid/*.yaml
echo "::endgroup::"

for file in test-data/invalid/*.yaml; do
  echo "::group::Check invalid workflow fails: $file"
  if actionlint "$file" 2>/dev/null; then
    echo "Expected actionlint to fail on $file, but it succeeded." >&2
    exit 1
  fi
  echo "Successfully caught expected error in $file"
  echo "::endgroup::"
done

echo "All tests passed successfully."
