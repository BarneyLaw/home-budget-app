# Phone-First Budget Tracking App

## Working Concept

A Flutter-based personal finance app that automatically tracks spending from notifications, emails, receipts, and fast manual entries. The goal is not to build another generic budgeting dashboard, but a genuinely useful daily money assistant that reduces manual logging and helps users make better spending decisions on the phone.

Possible names:

- PocketPulse
- SpendSense
- FlowBudget
- MoneyTrail

Core promise:

> Your spending updates itself from notifications, emails, and receipts. You only fix what the app is unsure about.

The app should feel closer to a polished mobile assistant than a spreadsheet. It should help users answer one simple question every day:

> Can I spend money today without messing up the rest of my month?

---

## Product Philosophy

Most budget apps fail because they require users to manually log every transaction, categorize everything, and stare at charts that do not change behavior.

This app should survive by focusing on:

1. Automatic transaction capture
2. Fast review and correction
3. Learning from user edits
4. Clear daily guidance
5. Trust, privacy, and transparency

The app should not open to ten charts. It should open to a useful daily summary, recent transactions, and anything that needs the user's attention.

The retention loop should be:

```text
Transaction appears automatically
    -> User confirms or fixes it in one tap
    -> App learns a rule
    -> Future transactions require less work
    -> User gets better safe-to-spend and insights
    -> User trusts app more
```

---

## Target Platforms

### Android

Android should be the strongest platform because it allows notification-based tracking through a notification listener service.

Android can support:

- Bank notification parsing
- Payment app notification parsing
- Merchant notification parsing
- Background capture
- Local-first transaction creation

### iOS

iOS is more restricted. It does not allow broad notification scraping in the same way Android does.

The iOS version should rely on:

- Email parsing
- Receipt forwarding
- Manual quick entry
- Bank export imports
- Open Banking APIs where available
- Shortcuts/share sheet workflows where practical

The product can be Android-first while keeping the Flutter UI and core domain logic shared.

---

# Feature List

## 1. Automatic Transaction Capture

### Android Notification Tracking

The Android app should use a native notification listener to detect transaction-like notifications from:

- Bank apps
- Credit/debit card alerts
- PayNow, PayLah!, and similar transfer systems
- Grab, Gojek, TADA, and ride-hailing apps
- Food delivery apps
- Shopee, Lazada, Amazon, and other shopping apps
- Wallet and payment apps
- Subscription services

The notification parser should extract:

```text
Amount
Currency
Merchant
Transaction type
Timestamp
Source app
Payment method
Direction: expense | income | transfer
Confidence score
```

The app must distinguish between real spending and non-spending events.

Examples:

```text
"You received $50" -> income or transfer-in
"You transferred $100 to John" -> transfer or shared expense
"Card charged $14.90 at Spotify" -> subscription
"Grab -$8.70" -> transport or food, depending on context
```

Notification capture should never blindly create transactions without deduplication and confidence scoring.

---

## 2. Email Receipt and Bank Alert Import

Email parsing is essential for iOS support and useful for Android as a secondary source.

Initial support:

- Gmail OAuth

Later support:

- Outlook
- Receipt forwarding address
- Manual `.eml` import

The email parser should detect:

- Bank alerts
- Payment receipts
- Ride-hailing receipts
- Food delivery receipts
- E-commerce orders
- App Store / Google Play subscriptions
- PayPal / Stripe receipts
- Travel bookings
- Utility bills

Email import should feed into the same transaction pipeline as notifications.

The app should include an email review inbox:

```text
12 new possible transactions found
8 auto-added
3 need review
1 ignored as duplicate
```

Users should be able to create rules from email-derived transactions:

```text
Always classify GrabFood as Food Delivery
Always ignore transfers to my savings account
Always mark NUS canteen as Food
```

---

## 3. Transaction Timeline

The transaction feed is the main ledger and should feel like a modern mobile timeline, not an accounting table.

Example:

```text
Today
$4.80   Kopi @ Canteen        Food
$12.90  Grab                  Transport
$19.99  Spotify               Subscription
+$250   PayNow from Alex      Transfer In
```

Useful interactions:

- Swipe right to categorize
- Swipe left to ignore
- Tap amount to edit
- Long press to split transaction
- One-tap "not spending" toggle
- Merge duplicate transactions
- Search by merchant, amount, category, or source
- Filter by date, account, category, or transaction type

The feed should support confidence states:

```text
Confirmed
Needs review
Ignored
Duplicate
Pending sync
```

---

## 4. Safe-to-Spend Number

This should be the primary dashboard feature.

Instead of overwhelming the user with charts, the app should show:

```text
Safe to spend this week: $86
You are pacing $12/day above target.
Rent and Spotify are already accounted for.
```

The safe-to-spend calculation should consider:

```text
Monthly budget
Remaining days in budget period
Recurring bills
Known upcoming payments
Savings goal
Current spending pace
Category limits
Cash buffer
```

The point is to answer:

> How much can I spend now without regretting it later?

---

## 5. Smart Budgets

The app should not force users to configure twenty categories on day one.

Budget modes:

### Simple Mode

```text
Monthly spend limit: $900
Savings goal: $300
Fixed bills: auto-detected
```

### Category Mode

```text
Food: $350
Transport: $120
Shopping: $200
Entertainment: $100
```

### Envelope Mode

```text
Needs
Wants
Savings
Debt
```

Users should be able to start simple and gradually add complexity.

---

## 6. Recurring Bills and Subscriptions

The app should automatically detect recurring payments.

Examples:

```text
Spotify     $19.99 monthly
Netflix     $22.98 monthly
iCloud      $3.98 monthly
Phone Bill  around $28 monthly
Gym         $95 monthly
```

Features:

- Upcoming subscription calendar
- Bills due soon
- Monthly recurring total
- Forgotten subscription warning
- Price increase detection
- Cancelled subscription detection
- Subscription category insights

This is a high-retention feature because users care about forgotten recurring charges.

---

## 7. Useful Spending Insights

Insights should be behavioral and specific, not generic.

Bad insight:

```text
You spent $432 on food.
```

Good insight:

```text
Food delivery is up 38% this month.
Most of the increase came from 6 late-night orders.
```

Insight examples:

```text
You spent $74 on purchases under $6 this week.
Grab rides are 2.1x higher than your usual weekday average.
You have 5 subscriptions totaling $63.94/month.
Your weekday lunch average is $7.80.
You spent $112 less than last month by this date.
Shopping spikes after midnight.
```

Insights should include supporting transactions and suggested actions.

Example:

```text
Food delivery is up 42%
You spent $118 on delivery this month, compared with $83 by this point last month.

[View orders] [Set limit] [Dismiss]
```

---

## 8. Transaction Rules Engine

The rules engine makes the app better over time.

Example rules:

```text
If merchant contains "SPOTIFY", category = Subscription
If source app is Grab and receipt says "Food", category = Food Delivery
If notification contains "received", transaction_type = income
If amount > $500 and recipient is own account, mark as transfer
If merchant is "NUS", category = School/Food depending on known place
```

User-facing rule suggestion:

```text
Rule suggested:
Always mark "Kopitiam" as Food?

[Yes] [No] [Edit]
```

Rules should have priority, conditions, actions, and enabled status.

```text
Rule
- id
- name
- priority
- condition
- action
- enabled
- createdAt
- updatedAt
```

---

## 9. Fast Manual Entry

Manual entry should take less than five seconds.

Example inputs:

```text
4.80 kopi
12.90 grab
35 haircut
paid alex 20 dinner
```

The parser should extract:

```text
Amount: 4.80
Merchant/note: kopi
Category: Food
```

Manual entry features:

- Quick Add floating action button
- Home screen widget
- Voice entry
- Natural language parsing
- Duplicate warning
- Recent merchant suggestions
- One-tap category chips

Manual entry should feel like sending a message, not filling a form.

---

## 10. Review Inbox

Low-confidence transactions should go into a review queue instead of being silently added.

Example:

```text
Needs review
$18.60 from DBS notification - possible Food
$50.00 PayNow to Marcus - transfer or spending?
$129.00 Apple - subscription or purchase?
```

Actions:

```text
Confirm
Edit
Ignore
Mark as transfer
Create rule
Merge duplicate
```

This keeps trust high while still allowing automation.

---

# User Experience Structure

## Bottom Navigation

The app should use five tabs maximum:

```text
Today
Transactions
Budget
Insights
Settings
```

---

## Today Screen

The daily cockpit.

Content:

```text
Safe to spend
Today's spend
Budget pace
Upcoming bills
Recent transactions
Needs review
```

Example:

```text
Safe to spend
$86

You've spent $18.40 today.
You're on track for the week.

Recent
$4.80  Kopi        Food
$8.70  Grab        Transport
$4.90  Snack       Food

Needs review
$50 PayNow to Alex - dinner or transfer?
```

---

## Transactions Screen

Searchable transaction ledger.

Features:

```text
Filter by category
Filter by source
Search merchant
Edit transaction
Split transaction
Merge duplicates
Export CSV
```

---

## Budget Screen

Budget planning and status.

Features:

```text
Monthly budget
Category budgets
Safe-to-spend calculation
Remaining budget
Budget history
Pace indicator
```

---

## Insights Screen

Focused on actionable insights.

Features:

```text
Trends
Recurring payments
Unusual spending
Merchant breakdown
Subscriptions
Small-purchase leaks
Category spikes
```

---

## Settings Screen

Features:

```text
Accounts
Notification sources
Email sources
Categories
Rules
Privacy
Export data
Backup
App lock
Currency
```

---

# Onboarding

Onboarding should be short and useful.

Flow:

```text
1. Choose currency
2. Set monthly budget
3. Optional savings goal
4. Enable notification access
5. Optional email connection
6. Choose tracking style
7. Done
```

Tracking styles:

```text
Relaxed - just show trends
Balanced - budgets and warnings
Strict - alerts before overspending
```

Do not ask the user to create every category upfront.

---

# Architecture Overview

## High-Level Architecture

```text
Flutter App
|
|-- Presentation Layer
|   |-- Screens
|   |-- Widgets
|   |-- State Controllers
|   |-- Navigation
|
|-- Application Layer
|   |-- Use Cases
|   |-- Services
|   |-- App Events
|   |-- Sync Orchestration
|
|-- Domain Layer
|   |-- Entities
|   |-- Value Objects
|   |-- Repository Interfaces
|   |-- Rules
|   |-- Classification Logic
|
|-- Data Layer
|   |-- Local Database
|   |-- Remote API Clients
|   |-- Email Data Source
|   |-- Notification Data Source
|   |-- Repository Implementations
|
|-- Platform Layer
    |-- Android Notification Listener
    |-- iOS Share/Shortcut Import
    |-- Native Permission Handling
    |-- Background Workers
```

---

## Recommended Flutter Stack

```text
Flutter
Riverpod
GoRouter
Freezed
JsonSerializable
Drift
Dio
Flutter Secure Storage
Local Auth
MethodChannel / EventChannel
```

Recommended choices:

```text
State management: Riverpod
Routing: GoRouter
Local database: Drift
Models: Freezed + JsonSerializable
Networking: Dio
Secure storage: Flutter Secure Storage
Charts: fl_chart or graphic
Native integration: MethodChannel / EventChannel
```

Drift is preferred for this project because budget apps are query-heavy and benefit from relational data modeling.

---

## Feature-First Folder Structure

Avoid dumping code into generic folders like `services/`, `models/`, `screens/`, and `utils/`.

Recommended structure:

```text
lib/
  app/
    router.dart
    theme.dart
    app.dart

  core/
    money/
    dates/
    errors/
    logging/
    security/

  features/
    transactions/
      domain/
      application/
      data/
      presentation/

    capture/
      domain/
      application/
      data/
      platform/

    budget/
      domain/
      application/
      data/
      presentation/

    insights/
      domain/
      application/
      data/
      presentation/

    rules/
      domain/
      application/
      data/
      presentation/

    recurring/
      domain/
      application/
      data/
      presentation/

    settings/
      presentation/
```

Each feature should own its own:

```text
Domain models
Use cases
Repository interfaces
Repository implementations
Screens
Widgets
Providers
```

---

## Architecture Pattern

Use a pragmatic clean architecture.

```text
Presentation
    -> Application / Use Cases
    -> Domain
    -> Repository Interfaces
    -> Data Sources
```

Example transaction flow:

```text
TransactionListScreen
    -> transactionFeedProvider
    -> WatchTransactionsUseCase
    -> TransactionRepository
    -> DriftTransactionRepository
    -> Local database
```

Example capture flow:

```text
AndroidNotificationListener
    -> RawCaptureDataSource
    -> ProcessRawCaptureUseCase
    -> Parser + Rules + Deduper + Classifier
    -> TransactionRepository
```

---

# Local-First Data Model

The app should work offline. Transactions should exist locally first and sync later.

Important entities:

```text
Transaction
Merchant
Category
Account
Budget
RecurringPayment
TransactionSource
RawCapture
Rule
Insight
ReviewItem
SyncEvent
UserPreference
```

---

## Transaction Entity

```text
Transaction
- id
- amount
- currency
- direction: expense | income | transfer
- merchantName
- normalizedMerchantId
- categoryId
- accountId
- occurredAt
- capturedAt
- sourceType: notification | email | manual | import | api
- sourceApp
- rawSourceId
- confidence
- status: confirmed | needsReview | ignored | duplicate
- notes
- isRecurring
- createdAt
- updatedAt
```

---

## RawCapture Entity

Raw notification or email data should be stored separately from the final transaction.

```text
RawCapture
- id
- sourceType
- sourceApp
- rawText
- receivedAt
- parsedAmount
- parsedMerchant
- parsedTimestamp
- parserVersion
- hash
- status
```

This allows future parser improvements and reprocessing.

---

## ReviewItem Entity

```text
ReviewItem
- id
- rawCaptureId
- proposedTransactionId
- reason
- confidence
- status: pending | resolved | ignored
- createdAt
- resolvedAt
```

---

## Insight Entity

```text
Insight
- id
- type
- title
- description
- severity
- supportingTransactionIds
- suggestedAction
- status: active | dismissed | resolved
- createdAt
- dismissedAt
```

---

# Capture Pipeline

The app should not directly turn every notification or email into a transaction. Use a structured pipeline.

```text
Raw input
   -> Normalize text
   -> Parse amount / merchant / time
   -> Classify transaction type
   -> Deduplicate
   -> Apply user rules
   -> Predict category
   -> Calculate confidence score
   -> Create confirmed transaction or review item
```

Example notification:

```text
DBS: You have spent SGD 12.90 at GRAB SINGAPORE on card ending 1234.
```

Pipeline output:

```text
amount: 12.90
currency: SGD
merchant: Grab
direction: expense
source: notification
category: Transport
confidence: 0.84
status: confirmed
```

If confidence is low:

```text
status: needsReview
reason: Could be transport or food delivery
```

---

# Parser Design

Use layered parsers.

```text
1. Known-source parsers
2. Generic bank notification parser
3. Generic receipt parser
4. Optional LLM fallback parser
```

Known-source parsers should be deterministic.

Examples:

```text
DBSParser
OCBCParser
UOBParser
GrabParser
ShopeeParser
GmailReceiptParser
```

Do not rely on an LLM for every parse. That would be expensive, slow, and less predictable.

Use LLM parsing only for:

```text
Ambiguous cases
Unknown receipt formats
Parser improvement suggestions
Natural language manual entries
```

---

# Deduplication Strategy

The same transaction may appear from multiple sources:

```text
Bank notification
Email receipt
Merchant app receipt
Manual entry
```

Use fuzzy matching based on:

```text
Amount
Currency
Merchant similarity
Timestamp window
Source account
Direction
```

Example:

```text
Grab notification at 12:05
Grab email receipt at 12:06
Same amount $14.30
```

Result:

```text
One transaction
Two linked sources
Higher confidence
```

The app should never silently create duplicate transactions when a likely match exists.

---

# Backend Architecture

A backend is useful for email sync, encrypted backup, multi-device sync, and heavier parsing.

Recommended backend stack:

```text
FastAPI
PostgreSQL
Redis
Celery or Dramatiq
SQLAlchemy
Docker Compose
```

Alternative:

```text
NestJS
PostgreSQL
Redis
BullMQ
Prisma
```

Recommended choice:

```text
FastAPI + PostgreSQL + Redis + Celery
```

---

## Backend Services

```text
Backend
|
|-- API Gateway
|
|-- Auth Service
|   |-- OAuth
|   |-- Session management
|   |-- Device keys
|
|-- Transaction Service
|   |-- CRUD
|   |-- Deduplication
|   |-- Categorization
|   |-- Recurring detection
|
|-- Email Ingestion Service
|   |-- Gmail OAuth
|   |-- Receipt parsing
|   |-- Bank alert parsing
|   |-- Sync cursors
|
|-- Rules Engine
|   |-- User rules
|   |-- Merchant normalization
|   |-- Category prediction
|   |-- Confidence scoring
|
|-- Insights Service
|   |-- Spending trends
|   |-- Anomaly detection
|   |-- Budget forecasts
|   |-- Subscription detection
|
|-- Sync Service
    |-- Conflict resolution
    |-- Offline queue
    |-- Device sync
```

---

# Privacy and Security

This app handles sensitive financial information. Trust must be treated as a product feature.

Principles:

```text
No bank passwords
No bank screen scraping
No selling user data
Clear permission controls
Local-first storage
Encrypted backups
Real account deletion
Minimal raw email storage
```

Security features:

- App lock with biometrics
- Encrypted local database
- OAuth token storage in secure storage
- Backend encryption at rest
- Per-user encryption keys where practical
- Raw email bodies minimized or not stored
- Option to process emails locally where practical
- Permission dashboard
- CSV export
- Full data deletion

Permission dashboard example:

```text
Notification access: Enabled
Gmail receipt scanning: Enabled
Bank emails: Enabled
Raw email storage: Disabled
Cloud sync: Enabled
```

---

# Development Phases

## Phase 1: Real Local MVP

Goal: useful without accounts.

Build:

```text
Flutter app shell
Local database
Manual transaction entry
Transaction feed
Categories
Monthly budget
Safe-to-spend number
Basic recurring detection
CSV export
```

This validates the product before automation.

---

## Phase 2: Android Automation

Build:

```text
Notification listener plugin
Raw notification capture
Permission onboarding
Parser pipeline
Deduplication
Review inbox
Rules engine
```

This makes the app meaningfully better than manual budget trackers.

---

## Phase 3: Email Import

Build:

```text
Gmail OAuth
Receipt parser
Bank alert parser
Email sync cursor
Duplicate linking
Review inbox integration
```

This improves iOS usefulness and catches transactions missed by notifications.

---

## Phase 4: Sync and Backup

Build:

```text
User accounts
Encrypted backup
Multi-device sync
Conflict resolution
Cloud settings
```

Do not build this before the app is useful locally.

---

## Phase 5: Intelligence Layer

Build:

```text
Advanced insights
Merchant normalization
Suggested rules
Budget recommendations
Subscription warnings
Anomaly detection
```

---

# MVP Scope

A strong first serious version should include:

```text
1. Flutter mobile app
2. Local SQLite database via Drift
3. Manual quick transaction entry
4. Transaction timeline
5. Categories
6. Monthly budget
7. Safe-to-spend number
8. Android notification capture
9. Parser pipeline
10. Deduplication
11. Review inbox
12. Rules engine
13. Basic recurring transaction detection
14. CSV export
```

Backend can be added after local value is proven.

---

# Features to Avoid Early

Avoid these in the first serious MVP:

```text
Crypto tracking
Stock portfolio tracking
Complicated double-entry accounting
Social features
Gamification badges
AI chatbot as the main interface
Desktop web app
Receipt OCR before email/notification parsing works
Too many charts
```

These may look impressive but do not solve the main retention problem.

---

# Killer Features to Prioritize

If only five features can be built first, prioritize:

```text
1. Android notification-based transaction capture
2. Safe-to-spend number
3. Review inbox with one-tap learning rules
4. Recurring subscriptions detection
5. Fast manual entry that feels like texting
```

These are the features most likely to make users come back.

---

# Final Recommended Architecture

```text
Flutter + Riverpod + GoRouter + Drift
Feature-first clean architecture
Local-first transaction engine
Android notification listener via native Kotlin plugin
Rules + parser + deduplication pipeline
Optional FastAPI backend for email sync and backup
PostgreSQL + Redis + background workers
Privacy-first permission model
```

Guiding principle:

> Capture automatically, ask only when uncertain, learn from every correction, and show one number that helps the user decide what to do today.
