# Declarative Migrations Homebrew tap agent instructions

## Formula and release invariants

- Formula versions, release URLs, target triples, binary names, checksums, licenses, homepage, installed support files, and upstream release notes must correspond to one verified upstream release.
- Never guess, copy stale checksums, or mix assets from different versions. Download each referenced asset and independently verify its digest before updating a formula.
- Preserve architecture and operating-system dispatch for supported macOS/Linux targets. Do not silently fall back to an incompatible binary.
- The formula must install only reviewed upstream release artifacts, keep package-manager paths confined, and avoid running untrusted build or post-install scripts.
- Test `brew audit`, formula parsing, install, executable smoke behavior, and relevant platform variants before release.
- Coordinate formula changes with the upstream repository's tag, release assets, `.cli-flags.toml`, documentation, and release automation.

## Instruction discovery

Resolve `$PWD`, walk upward through every parent directory to the filesystem root, read every readable lowercase `agents.md` on that ancestor chain, and apply them root-to-leaf. Do not search siblings. Deduplicate resolved paths/inodes, avoid symlink cycles, and report unreadable files.

## Synchronize with the remote

Before editing, inspect `git status`, current branch, configured remotes, and the default branch. Run `git fetch --all --prune` and create the feature branch from the latest remote default branch. Fetch again before pushing and incorporate upstream changes with `git merge` or `git pull` on a clean working tree.

- avoid git rebase in favor of git merge.
- Never discard remote commits, force-push, rewrite shared history, bypass review, or bypass required CI.

## Resolve Git conflicts semantically

Resolve conflicts by understanding and combining both sides' intent. Do not mechanically choose `ours`, `theirs`, current, or incoming changes. Produce the conceptually correct formula while preserving one coherent release version, correct per-platform URLs/checksums, install behavior, support files, tests, documentation, and upstream provenance. Recompute formula metadata from the verified merged release state instead of retaining mismatched lines from either side. If intentions are incompatible, make the smallest explicit design decision and document it in the pull request.

After resolving, reread every affected formula from the top, redownload and verify every asset/checksum, run Homebrew audit/style/install/smoke tests, compare against upstream release metadata, and search the entire worktree for conflict markers:

```sh
grep -RInE '^(<<<<<<<|=======|>>>>>>>)' --exclude-dir=.git .
```

If any marker or suspicious partial resolution remains, repeat semantic resolution from the top and rerun validation. A conflict is resolved only when the tap describes a coherent verified release, not merely when Git or Ruby accepts the formula.