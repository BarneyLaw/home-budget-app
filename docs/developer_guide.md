# PocketPulse Developer Guide

This guide documents how the app is structured, how to run it, and how future
work should fit into the existing architecture.

## Product Boundary

PocketPulse is a phone-first local budgeting assistant. The product spine is:

```text
raw input -> normalize -> parse -> classify -> deduplicate -> apply rules
-> predict category -> confidence score -> confirmed transaction or review item
```

The app should keep the daily safe-to-spend number central. Avoid turning it
into a generic spreadsheet or chart dashboard.

## Stack

Fixed stack:

- Flutter
- Riverpod
- GoRouter
- Drift
- Freezed
- json_serializable
- Dio
- flutter_secure_storage
- local_auth
- fl_chart

Do not substitute state management, routing, database, or generation frameworks
without an architecture decision record.

## Project Layout

```text
lib/
  app/
    app.dart
    router.dart
    theme.dart

  core/
    database/
    dates/
    money/
    preferences/

  features/
    budget/
      application/
      data/
      domain/
      presentation/

    capture/
      application/
      domain/
      platform/

    insights/
    recurring/
    rules/
    settings/
    today/
    transactions/
```

Keep feature behavior under the relevant feature folder. Shared primitives such
as money, dates, database, errors, logging, security, and preferences belong in
`core/`.

Do not create a generic `utils/` folder.

## Local Setup

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter build web
```

Serve the compiled web build:

```sh
python3 -m http.server 8080 --directory build/web
```

Open `http://localhost:8080`.

## Tooling Limits In The Current Container

Available:

- Flutter
- Dart
- Web build
- Unit/widget tests

Unavailable in the current container:

- Android SDK
- Java/Gradle runtime
- `adb`
- `sdkmanager`
- Android emulator
- Chrome executable

Android native code can be edited here, but it cannot be compiled or device
tested until those tools exist.

## Generated Code

Generated files are committed because the app needs to build in environments
that do not run code generation automatically.

Generated from:

- `lib/core/database/app_database.dart`
- `lib/core/preferences/app_preferences.dart`

Regenerate after schema/model changes:

```sh
dart run build_runner build --delete-conflicting-outputs
```

Drift web runtime assets:

- `web/sqlite3.wasm`
- `web/drift_worker.js`

If the Drift version changes, rebuild the worker:

```sh
dart compile js tool/drift_worker.dart -O4 -o web/drift_worker.js
```

Remove any stale `sourceMappingURL` reference if the map file is not committed.

## Data Layer

The Drift database is defined in `lib/core/database/app_database.dart`.

Main tables:

- `transaction_records`
- `category_records`
- `budget_records`
- `category_budget_records`
- `recurring_rule_records`
- `user_rule_records`
- `raw_capture_records`
- `review_item_records`
- `insight_records`
- `preference_records`

`LocalBudgetStore` maps between Drift records and domain entities. Presentation
and application code should use domain objects, not generated Drift row classes.

When adding persistence:

- Add or update the Drift table.
- Regenerate code.
- Add mapper logic in the relevant data store or repository implementation.
- Add a migration if schema version increases.
- Add tests for domain behavior affected by the change.

## Money Rules

All money amounts are integer minor units.

Required:

- Use `Money` for money values.
- Use `Money.fromDecimal` for user-entered decimal text.
- Use `Money.toDecimalString` for CSV/storage-friendly decimal output.
- Never use `double` to represent, calculate, or persist money amounts.

Acceptable exceptions:

- Chart rendering can convert already-computed integer minor units to a visual
  axis value.
- Confidence scores can use `double`; they are not money.

## State Management

`budgetStateProvider` owns the current in-app state and hydrates from
`LocalBudgetStore`.

Use controller methods for mutations so persistence remains centralized:

- Add manual entry.
- Confirm/ignore/merge review items.
- Update transaction details.
- Change category.
- Split transaction.
- Update plan values.
- Update preferences.

Avoid mutating lists directly in presentation widgets.

## Routing

Routes are defined in `lib/app/router.dart` with `GoRouter` and a
`StatefulShellRoute`.

The bottom navigation tabs are:

- Today
- Transactions
- Budget
- Insights
- Settings

Keep the five-tab structure unless there is a product decision to change the UX.

## Capture Pipeline

Current parser entrypoint:

```text
CapturePipeline.parseNotification
```

Native Android notification bridge:

- Dart contract: `lib/features/capture/platform/notification_capture_channel.dart`
- Kotlin bridge: `android/app/src/main/kotlin/.../MainActivity.kt`
- Kotlin listener: `android/app/src/main/kotlin/.../NotificationCaptureService.kt`

Rules:

- Do not blindly confirm low-confidence captures.
- Deduplicate before counting a transaction.
- Store raw capture data when integrating real notification/email sources.
- Surface uncertain results in review.

## Rules Engine

Rules are defined by:

- Priority
- Condition
- Action
- Enabled status

Lower priority number runs first. Future rule actions should be explicit and
test-covered. Avoid hidden side effects.

## Recurring Detection

Recurring detection currently uses merchant grouping and repeated confirmed
expenses. Future improvements should consider:

- Similar amount tolerance.
- Monthly date windows.
- Missed/cancelled subscription detection.
- Price increase detection.

Every recurring rule change needs a unit test.

## Insights

Insights should be actionable and specific.

Good:

```text
You spent $74 on purchases under $6 this week.
```

Avoid:

```text
You spent $432 on food.
```

Charts should remain limited. The app should not become a chart dashboard.

## Tests

Run before every commit:

```sh
dart format lib test tool
flutter analyze
flutter test
```

Run before PR handoff:

```sh
flutter build web
```

Domain rules require unit tests:

- Safe-to-spend
- Deduplication
- Recurring detection
- Capture parsing
- Manual entry parsing
- Rules engine
- CSV export

Widget tests should avoid native SQLite in this container because
`libsqlite3.so` is unavailable. Override providers with seeded in-memory state
when testing UI.

## Adding A Feature

Use this checklist:

1. Create a feature branch from current `origin/main`.
2. Add or update domain entities and tests first.
3. Add application/use-case logic.
4. Add data persistence if needed.
5. Add presentation/UI.
6. Run format, analysis, tests, and web build.
7. Update user/developer docs when behavior changes.
8. Push the branch for PR review.

## Android Work

Before Android native verification, install:

- Android SDK
- Java JDK compatible with the Flutter/Gradle setup
- Android Gradle tooling
- `adb`
- A device or emulator

Then verify:

```sh
flutter build apk
flutter run
```

Device-test notification listener permission flow and notification event
delivery before marking Android automation complete.
