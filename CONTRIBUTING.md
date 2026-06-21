# Contributing Workflow

This repository uses feature branches, PR-sized changes, and small conventional
commits. Do not land broad, unrelated work directly on `main`.

## Branching

Start every task from an up-to-date `main`:

```sh
git fetch origin
git switch main
git pull --ff-only origin main
```

Create a branch for the work:

```sh
git switch -c <type>/<short-description>
```

Branch prefixes:

- `feat/` for user-facing features.
- `fix/` for bug fixes.
- `docs/` for documentation.
- `test/` for test-only changes.
- `refactor/` for behavior-preserving restructuring.
- `chore/` for tooling, generated project files, or maintenance.

Examples:

```text
feat/manual-entry-duplicate-review
fix/money-decimal-parsing
docs/user-developer-guides
test/recurring-detector-cases
```

## PR Scope

Each feature should be its own PR.

A PR should contain one coherent product or engineering slice:

- One feature.
- One bug fix.
- One documentation topic.
- One infrastructure/tooling change.

Do not mix unrelated UI, data-layer, docs, and tooling work in one PR unless the
change cannot function without all of them.

## Commit Scope

Each logical change should be its own commit.

Good commit boundaries:

- Domain model or value object change.
- Parser/rules/safe-to-spend logic change.
- Drift schema and generated code for one persistence change.
- UI for one screen or workflow.
- Tests for one behavior.
- Documentation for one audience or process.

Bad commit boundaries:

- "Update app"
- "WIP"
- A full feature plus unrelated docs plus generated scaffolding.
- Formatting mixed with behavior changes unless formatting is required by the
  touched files.

## Commit Messages

Use Conventional Commits:

```text
<type>: <short imperative summary>
```

Allowed types:

- `feat`
- `fix`
- `docs`
- `test`
- `refactor`
- `chore`
- `build`
- `ci`

Examples:

```text
feat: add transaction split action
fix: parse notification merchant case-insensitively
docs: add developer guide
test: cover duplicate manual entry review
build: add drift code generation dependencies
```

## Required Checks

Before each commit that changes Dart code:

```sh
dart format lib test tool
flutter analyze
flutter test
```

Before opening or updating a PR that affects the runnable app:

```sh
flutter build web
```

If Android native code changes, run Android verification when the toolchain is
available:

```sh
flutter build apk
```

If a check cannot run because the environment lacks tooling, document that in
the PR summary and final handoff.

## Generated Files

Commit generated files with their source change when they are required for the
app to build:

- Drift generated files.
- Freezed generated files.
- json_serializable generated files.
- Flutter platform scaffolds.
- Required web runtime assets.

Do not commit build outputs from `build/`, `.dart_tool/`, local IDE state, or
machine-specific files.

## Documentation Requirements

Update docs in the same PR when user-visible behavior or developer workflow
changes.

Docs to consider:

- `README.md`
- `docs/user_guide.md`
- `docs/developer_guide.md`
- `docs/implementation_status.md`
- `CONTRIBUTING.md`
- `AGENTS.md`

## Agent Rules

Autonomous agents must follow the same process:

- Create a task branch unless explicitly told to work directly on `main`.
- Commit each logical change separately.
- Keep commits small enough to review.
- Push the branch and report the branch name and commit list.
- Do not squash or rewrite pushed history without explicit user approval.

If a previous change was committed too broadly, do not rewrite shared history by
default. Add corrective documentation and use proper commit structure from that
point forward.
