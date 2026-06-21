# AGENTS.md — flutter-budget-app

You are working inside a headless Flutter dev container (toolchain: `flutter`)
on a K3s homelab. Instructions reach you as files in `~/agent-inbox/in/*.task`;
results go to `~/agent-inbox/out/`. The workspace repo is checked out at
`~/workspace`. You have a **single-repo, fine-grained GitHub PAT** — you may
push to THIS repo only. Do not attempt account-wide operations.

## What this app is

A phone-first personal budget tracker. The core promise: *spending updates
itself from notifications, emails, and receipts; the user only fixes what the
app is unsure about.* The product's spine is a **capture pipeline** (raw input →
normalize → parse → classify → deduplicate → apply rules → predict category →
confidence score → confirmed transaction or review item) and **one number** —
*safe to spend* — answering "can I spend today without messing up my month?"

Full product spec lives in `docs/architecture.md` (copy it in from the project
doc). Read it before large changes. Do **not** invent scope beyond it.

## Stack (fixed — do not substitute)

- Flutter, **Riverpod** (state), **GoRouter** (routing)
- **Drift** (local SQLite; the app is query-heavy and relational)
- **Freezed** + **json_serializable** (models / value objects)
- **Dio** (networking, later), **flutter_secure_storage**, **local_auth**
- Charts: `fl_chart` (used sparingly — this is not a charts app)
- Feature-first clean architecture (see folder layout below)

## Folder layout (authoritative)

```
lib/
  app/        router.dart, theme.dart, app.dart
  core/       money/ dates/ errors/ logging/ security/
  features/
    <feature>/
      domain/         entities, value objects, repository interfaces, rules
      application/     use cases, services
      data/            drift tables/daos, repository impls, data sources
      presentation/    screens, widgets, riverpod controllers
```

Features for the MVP: `transactions`, `budget`, `categories`, `recurring`,
`rules`, `review`, `manual_entry`, `today` (dashboard). Keep cross-feature
code in `core/`, never a generic `utils/` dump.

## SCOPE — build Phase 1 only (Real Local MVP)

Goal: useful **without accounts, without backend, without notifications**.
Validate the product locally first. Build, in order:

1. Flutter app shell + theme + GoRouter with the 5 bottom tabs:
   Today, Transactions, Budget, Insights, Settings.
2. Drift schema + DAOs for: `transactions`, `categories`, `budgets`,
   `recurring_rules`, `user_rules`. Money stored as integer minor units
   (cents), never floats. Currency as ISO code on each transaction.
3. **Fast manual entry** that feels like texting: parse inputs like
   `4.80 kopi`, `12.90 grab`, `paid alex 20 dinner` → amount + note + guessed
   category. This is a core/manual_entry parser, deterministic, no LLM.
4. Transaction timeline (the main ledger): grouped by day, swipe to
   categorize / ignore, tap to edit, confidence states
   (confirmed / needsReview / ignored / duplicate / pendingSync).
5. Categories (start with a small default set; don't force 20 on day one).
6. Monthly budget (Simple Mode first: one spend limit + savings goal).
7. **Safe-to-spend** calculation: monthly budget − committed (recurring +
   known upcoming) − spent-so-far, spread over remaining days. Show pace.
8. Basic recurring detection (same merchant + similar amount + ~monthly).
9. CSV export.

Explicitly **OUT of scope for Phase 1** (do not build): Android notification
listener, Gmail OAuth/email parsing, the FastAPI backend, multi-device sync,
LLM fallback parser, OCR, charts beyond one simple trend. These are later
phases in the spec.

## Engineering rules

- Every domain rule (safe-to-spend, dedup, recurring detection) gets a unit
  test. Correctness over speed — this app handles the user's money.
- Money: integer minor units everywhere; a `Money` value object in `core/money`
  owns formatting and arithmetic. No `double` for amounts.
- Deduplication, even in Phase 1 manual entry, must not silently create a
  duplicate when a likely match exists — surface it as a review item.
- Run `dart format`, `flutter analyze`, and `flutter test` before any commit.
  Do not commit if analyze or tests fail.
- Conventional commits. Small, reviewable commits per feature slice.
- After completing a task, write a short summary of what changed and what's
  next to `~/agent-inbox/out/<task>.result` (the runner does the file part;
  you just produce a clear final message).

## How work arrives

A `.task` file's body is your prompt. Optional first line `#!agent: codex`
or `#!agent: claude` selects the engine; default is claude. Treat each task
as one bounded unit of work against `~/workspace`. If a task is ambiguous or
would exceed Phase 1 scope, stop and say so in the result rather than guessing.