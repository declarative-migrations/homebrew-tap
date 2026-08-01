# declarative-migrations/homebrew-tap

Homebrew tap for [**dpm**](https://github.com/declarative-migrations/declarative-postgres-migrate.rs) —
declarative, ORM-agnostic PostgreSQL and CockroachDB schema migration.

## Install

```sh
brew install declarative-migrations/tap/dpm
```

That is shorthand for `brew tap declarative-migrations/tap && brew install dpm`.
The formula installs the prebuilt release binary for your OS/arch (macOS and
Linux, arm64 and x86_64) from the
[dpm releases](https://github.com/declarative-migrations/declarative-postgres-migrate.rs/releases),
verified against a pinned `sha256`.

```sh
dpm version
dpm help
```

## Upgrade

```sh
brew update && brew upgrade dpm
```

## What's the formula pinned to?

[`Formula/dpm.rb`](Formula/dpm.rb) pins an exact `version` and per-platform
`sha256`. Each dpm release bumps them; CI ([`.github/workflows/ci.yml`](.github/workflows/ci.yml))
`brew audit`s and `brew style`s the formula and actually **installs it and runs
its test block** on macOS and Linux — so a merged formula is one that provably
installs and runs.

Non-Homebrew install paths (curl script, `cargo install`, direct release
binaries) are documented in the
[dpm README](https://github.com/declarative-migrations/declarative-postgres-migrate.rs#install).

## License

MIT © Alex Mills. See [LICENSE](LICENSE). dpm itself is MIT-licensed.
