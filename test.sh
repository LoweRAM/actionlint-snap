#!/bin/bash
# Basic tests for the actionlint snap.

set -euo pipefail

export PATH="/snap/bin:$PATH"

echo "::group::Check actionlint version"
actionlint --version
echo "::endgroup::"

echo "::group::Lint repo workflows"
actionlint
echo "::endgroup::"

echo "::group::Check valid workflow via stdin"
actionlint - << 'EOF'
name: Valid Workflow
on: push
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - run: echo "hello world"
EOF
echo "::endgroup::"

echo "::group::Check invalid workflow fails"
if actionlint - << 'EOF' 2>/dev/null
name: Invalid
EOF
then
  echo "Expected actionlint to fail on invalid workflow, but it succeeded." >&2
  exit 1
fi
echo "::endgroup::"

echo "::group::Check bundled shellcheck integration"
if actionlint - << 'EOF' 2>/dev/null
name: ShellCheck Test
on: push
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - run: echo $unquoted_variable
EOF
then
  echo "Expected actionlint to report shellcheck issue SC2086, but it succeeded." >&2
  exit 1
fi
echo "::endgroup::"

echo "All tests passed successfully."
