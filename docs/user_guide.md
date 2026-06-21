# PocketPulse User Guide

PocketPulse is a phone-first personal budget tracker. It is designed around one
daily question: can I spend today without harming the rest of my month?

The app is local-first. Current data is stored on the device or browser profile
through the local Drift database. Backend sync, Gmail import, and full Android
notification capture are future-facing integrations.

## Getting Started

Run the app in a Flutter environment:

```sh
flutter pub get
flutter run
```

For a browser preview:

```sh
flutter build web
python3 -m http.server 8080 --directory build/web
```

Open `http://localhost:8080`.

## Main Tabs

### Today

The Today tab is the daily cockpit.

Use it to:

- See the safe-to-spend amount for the week.
- Check spending today and budget pace.
- Add a transaction quickly.
- Review uncertain or duplicate transactions.
- Confirm, ignore, mark as transfer, or create a rule from review items.

### Transactions

The Transactions tab is the ledger.

Use it to:

- Search by merchant, category, or source.
- Filter by status, category, and source.
- Review transactions grouped by day.
- Tap a transaction to edit details, change category, split, mark as transfer,
  ignore, or merge a duplicate.

Statuses:

- `confirmed`: counted in budget and safe-to-spend.
- `needsReview`: awaiting user confirmation.
- `duplicate`: likely duplicate; review before counting.
- `ignored`: kept in history but excluded from budget calculations.
- `pendingSync`: reserved for future sync flows.

### Budget

The Budget tab manages the monthly plan.

Use it to:

- Edit monthly spend limit.
- Edit savings goal.
- Edit cash buffer.
- Edit fixed bills.
- Edit category limits.
- See category progress for the active month.

Simple mode is the current primary budget mode. Category and envelope-style
budgets can build on the same plan model later.

### Insights

The Insights tab focuses on actionable patterns.

Current insight types:

- Small-purchase leak detection.
- Recurring payment totals.
- A compact category spend chart for the current month.
- Basic subscription/recurring detection.

Insights should remain specific and behavioral. Avoid adding generic chart-heavy
views unless they help the user act.

### Settings

The Settings tab contains preferences and privacy controls.

Current controls:

- Notification capture toggle.
- Email scanning toggle.
- Tracking style: relaxed, balanced, strict.
- Cloud backup toggle.
- Raw email storage toggle.
- App lock toggle.
- CSV export.
- Local data reset.

Some toggles represent planned integrations. They are intentionally visible so
the permission and privacy model is clear before backend/native integrations are
fully built.

## Quick Entry

Manual entry should feel like sending a short text message.

Examples:

```text
4.80 kopi
12.90 grab
35 haircut
paid alex 20 dinner
```

The parser extracts:

- Amount in integer cents.
- Merchant or note.
- Direction: expense, income, or transfer.
- A deterministic category guess.

If a new manual entry looks like an existing transaction, PocketPulse marks it
as `duplicate` for review instead of silently counting it twice.

## Review Workflow

Use the review queue when the app is uncertain.

Recommended review actions:

- Confirm when the transaction is correct.
- Change category if the guess is wrong.
- Mark as transfer when the movement is not spending.
- Ignore when it should not affect the budget.
- Merge duplicate when another source already captured it.
- Create a rule when the same merchant should be handled the same way next time.

## CSV Export

Open Settings, then choose Export CSV.

The export includes:

- Transaction id.
- Timestamp.
- Amount and currency.
- Direction.
- Merchant.
- Category.
- Source type and source app.
- Status.
- Confidence.
- Notes.

## Data And Privacy

Current local-first behavior:

- Money is stored as integer minor units, not floating-point values.
- Local persistence uses Drift.
- Web persistence uses Drift's SQLite wasm/worker setup.
- Android notification capture has a native bridge, but native compilation and
  device testing require Android SDK tooling.

Privacy principles:

- Do not ask for bank passwords.
- Do not scrape bank screens.
- Minimize raw email storage.
- Keep data local until explicit backup/sync work exists.
- Make permission status visible in Settings.

## Known Limits

- Android notification listener code is present but not verified in this
  container because Android SDK, Java/Gradle, and device/emulator tooling are
  unavailable.
- Gmail OAuth and receipt parsing are not implemented yet.
- Cloud sync and encrypted backup are not implemented yet.
- There is no full onboarding wizard yet; seeded defaults make the app usable
  immediately.
