# Implementation Status

This repository now contains a Flutter source implementation for the local-first
MVP described in `flutter_budget_app_architecture.md`.

## Implemented

- Five-tab mobile app shell: Today, Transactions, Budget, Insights, Settings.
- Safe-to-spend calculation using monthly limit, savings goal, fixed bills, cash
  buffer, remaining days, and confirmed expenses.
- Fast manual entry parser for inputs such as `4.80 kopi` and
  `paid alex 20 dinner`.
- Transaction timeline with search and status filters.
- Review inbox actions: confirm, ignore, and mark as transfer.
- Deterministic notification parsing demo for bank-style alerts.
- Duplicate-aware capture simulation.
- Basic recurring payment detection.
- Basic spending insights for small purchases and subscriptions.
- Feature-first folder structure aligned with the architecture brief.

## Current Data Layer

The app currently uses seeded in-memory Riverpod state. This keeps the first
source checkpoint readable and runnable once Flutter is available, while leaving
the Drift persistence layer as the next implementation step.

## Tooling Note

The container used for this session does not have `flutter` or `dart` installed,
so local execution of `flutter pub get`, `flutter analyze`, or `flutter test`
was not possible in this environment. Tests are included under `test/` for the
core budgeting, parsing, and capture logic.

## Next Engineering Steps

1. Add generated Flutter platform folders with `flutter create .`.
2. Install dependencies with `flutter pub get`.
3. Run `flutter analyze` and `flutter test`.
4. Replace the in-memory state with Drift tables and repositories.
5. Add the Android notification listener plugin and connect it to the capture
   pipeline.
