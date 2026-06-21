# home-budget-app

PocketPulse is a phone-first budgeting app prototype based on
`flutter_budget_app_architecture.md`. It focuses on the core daily workflow:
capture spending quickly, review uncertain transactions, learn from corrections,
and show a safe-to-spend number before charts.

## Current MVP Slice

- Flutter app shell with Today, Transactions, Budget, Insights, and Settings.
- Local Drift persistence with web SQLite worker/wasm assets.
- Safe-to-spend dashboard driven by monthly budget, savings goal, fixed bills,
  cash buffer, and current spending pace.
- Fast manual entry parser for text-style inputs such as `4.80 kopi`.
- Transaction timeline with day grouping, search, filters, edit, category,
  split, transfer, ignore, and duplicate-review actions.
- Editable simple budget and category limits.
- Demo notification capture pipeline with confidence scoring and duplicate
  handling.
- Rule engine with user-created review rules and seeded merchant rules.
- Basic recurring payment detection and actionable insights with one compact
  category spend chart.
- CSV export generation from the transaction ledger.
- Android scaffold with a native Kotlin notification listener bridge matching
  the Dart platform-channel contract.

## Project Layout

```text
lib/
  app/                    App shell, router, theme
  core/                   Database, preferences, money/date primitives
  features/
    budget/               Budget plan and safe-to-spend logic
    capture/              Raw capture parsing pipeline
    insights/             Spending insight generation
    recurring/            Recurring payment detection
    rules/                User rule domain and rule engine
    settings/             Settings UI
    today/                Daily cockpit UI
    transactions/         Transaction domain, parser, timeline UI
```

## Running Locally

This repository contains a generated Flutter web scaffold and the source files
for the app. In an environment with Flutter installed:

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter build web
```

To serve the compiled web build:

```sh
python3 -m http.server 8080 --directory build/web
```

Android native compilation and verification still require an Android SDK,
Java/Gradle, and a device or emulator. See `docs/implementation_status.md` for
details.
