# home-budget-app

PocketPulse is a phone-first budgeting app prototype based on
`flutter_budget_app_architecture.md`. It focuses on the core daily workflow:
capture spending quickly, review uncertain transactions, learn from corrections,
and show a safe-to-spend number before charts.

## Current MVP Slice

- Flutter app shell with Today, Transactions, Budget, Insights, and Settings.
- Safe-to-spend dashboard driven by monthly budget, savings goal, fixed bills,
  cash buffer, and current spending pace.
- Fast manual entry parser for text-style inputs such as `4.80 kopi`.
- Transaction timeline with status filtering and review actions.
- Demo notification capture pipeline with confidence scoring and duplicate
  handling.
- Basic recurring payment detection and actionable insights.

## Project Layout

```text
lib/
  app/                    App shell, router, theme
  core/                   Shared money/date primitives
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

This repository contains the Flutter source files and tests. In an environment
with Flutter installed:

```sh
flutter create .
flutter pub get
flutter test
flutter run
```

The current execution container did not include `flutter` or `dart`, so those
commands could not be run during this implementation session. See
`docs/implementation_status.md` for the verification status and next steps.
