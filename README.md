# actionlint

<p align="center"><b>This is the snap for actionlint</b>. It is a package to easily install actionlint on Ubuntu, Fedora, Debian and other major Linux distributions. It is available in the Snap Store, Ubuntu Software, and a number of other applications.</p>

<p align="center"><i>"Static checker for GitHub Actions workflow files"</i></p>

<p align="center">
<a href="https://snapcraft.io/actionlint"><img src="https://snapcraft.io/actionlint/badge.svg" alt="Snap Status"></a>
<a href="https://github.com/lengau/actionlint-snap/actions/workflows/sync-version-with-upstream.yaml"><img src="https://github.com/lengau/actionlint-snap/actions/workflows/sync-version-with-upstream.yaml/badge.svg" alt="Sync Version Status"></a>
<a href="https://github.com/lengau/actionlint-snap/actions/workflows/test-daily.yaml"><img src="https://github.com/lengau/actionlint-snap/actions/workflows/test-daily.yaml/badge.svg" alt="Daily Tests Status"></a>
</p>

## Install

```shell
snap install actionlint
```

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))

## Features

[actionlint](https://github.com/rhysd/actionlint) is a static checker for GitHub Actions workflow files.

- **Syntax check for workflow files** to catch unexpected or missing keys following workflow syntax
- **Strong type check for `${{ }}` expressions** to catch semantic errors (property access, type mismatches, etc.)
- **Actions usage check** to verify inputs at `with:` and outputs in `steps.{id}.outputs`
- **Reusable workflow check** to validate inputs, outputs, and secrets of reusable workflows and workflow calls
- **Integrated shellcheck and pyflakes** for scripts in `run:` steps
- **Security checks** for untrusted inputs and hard-coded credentials

## How to contribute to this snap

Thanks for your interest! Below you find instructions to help you contribute to this snap.

The general workflow is to submit pull requests that merge your changes into the `candidate` branch here on GitHub.

### Submitting changes in a pull request

1. [Fork the repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo) into your own GitHub namespace.
2. Clone your fork locally.
3. Create a branch based on `candidate`:

   ```shell
   git checkout -b my-feature-branch candidate
   ```

4. Make your desired changes and verify them locally:

   ```shell
   ./test.sh
   ```

5. Build the snap locally using Snapcraft:

   ```shell
   snapcraft pack --use-lxd
   ```

6. Commit and push changes to your fork, then open a pull request against `lengau/actionlint-snap:candidate`.

## Maintainers

- [@lengau](https://github.com/lengau)

## License

- The build files in this repository are licensed under the MIT License.
- actionlint is licensed under the MIT License. More information is available in the [upstream actionlint repository](https://github.com/rhysd/actionlint).
