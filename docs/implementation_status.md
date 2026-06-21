# Implementation Status

This repository now contains a Flutter source implementation for the local-first
MVP described in `flutter_budget_app_architecture.md`.

## Implemented

- Five-tab mobile app shell: Today, Transactions, Budget, Insights, Settings.
- Flutter web scaffold with Drift web worker and SQLite wasm assets.
- Drift local database schema and DAOs for transactions, categories, budgets,
  category budgets, recurring rules, user rules, raw captures, review items,
  insights, and preferences.
- Local budget store that seeds the first run and persists budget, transaction,
  rule, and preference changes.
- Safe-to-spend calculation using monthly limit, savings goal, fixed bills, cash
  buffer, remaining days, and confirmed expenses.
- Fast manual entry parser for inputs such as `4.80 kopi` and
  `paid alex 20 dinner`, using integer minor units instead of floating-point
  amount parsing.
- Transaction timeline grouped by day with search, category/source/status
  filters, edit, recategorize, split, transfer, ignore, and duplicate merge
  actions.
- Review inbox actions: confirm, ignore, mark as transfer, merge duplicate, and
  create a learning rule.
- Editable monthly budget, savings goal, cash buffer, fixed bills, and category
  budgets.
- Review inbox rule creation for merchant-category learning.
- Deterministic notification parsing demo for bank-style alerts.
- Duplicate-aware manual entry and capture simulation.
- Seeded rules and rule application for new manual/captured transactions.
- Basic recurring payment detection.
- Basic spending insights for small purchases and subscriptions, plus a compact
  category spending chart.
- CSV export generation from the local transaction ledger.
- Freezed/json_serializable preferences model for tracking style, capture
  source toggles, app lock, cloud backup, and raw email storage choices.
- Repository interfaces for the future Drift-backed budget and transaction
  stores.
- Dart `MethodChannel`/`EventChannel` contract for Android notification capture.
- Android scaffold plus native Kotlin notification listener bridge for the
  notification permission method channel and notification event stream.
- Feature-first folder structure aligned with the architecture brief.

## Current Data Layer

The app uses seeded Riverpod state hydrated from a Drift local database. On web,
Drift opens through `web/drift_worker.js` and `web/sqlite3.wasm`; on native
Flutter targets it uses `drift_flutter`'s platform database opener.

## Tooling Note

Flutter and Dart are available in the current container. Android SDK, Java,
Gradle, `adb`, `sdkmanager`, `emulator`, and Chrome are not installed, so Android
native compilation and Chrome-driven web runs were not verified here.

Verified in this session:

```sh
flutter analyze
flutter test
flutter build web
```

## Next Engineering Steps

1. Compile and device-test the Android notification listener once Android SDK
   tooling is available.
2. Add Gmail OAuth and receipt parsing behind the existing email source toggle.
3. Add encrypted backup/sync once a backend exists.
4. Add browser or device-based manual QA once Chrome or Android tooling is
   available.
