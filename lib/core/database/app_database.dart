import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DataClassName('TransactionRecord')
class TransactionRecords extends Table {
  TextColumn get id => text()();
  IntColumn get amountMinor => integer()();
  TextColumn get currency => text().withDefault(const Constant('SGD'))();
  TextColumn get direction => text()();
  TextColumn get merchantName => text()();
  TextColumn get normalizedMerchantId => text().nullable()();
  TextColumn get categoryId => text()();
  TextColumn get accountId => text()();
  DateTimeColumn get occurredAt => dateTime()();
  DateTimeColumn get capturedAt => dateTime()();
  TextColumn get sourceType => text()();
  TextColumn get sourceApp => text().nullable()();
  TextColumn get rawSourceId => text().nullable()();
  RealColumn get confidence => real()();
  TextColumn get status => text()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('CategoryRecord')
class CategoryRecords extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get colorValue => integer()();
  IntColumn get iconCodePoint => integer()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('BudgetRecord')
class BudgetRecords extends Table {
  TextColumn get id => text()();
  TextColumn get mode => text()();
  IntColumn get monthlyLimitMinor => integer()();
  IntColumn get savingsGoalMinor => integer()();
  IntColumn get cashBufferMinor => integer()();
  IntColumn get fixedBillsMinor => integer()();
  TextColumn get currency => text().withDefault(const Constant('SGD'))();
  DateTimeColumn get periodStart => dateTime()();
  DateTimeColumn get periodEnd => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('CategoryBudgetRecord')
class CategoryBudgetRecords extends Table {
  TextColumn get budgetId => text()();
  TextColumn get categoryId => text()();
  IntColumn get limitMinor => integer()();
  TextColumn get currency => text().withDefault(const Constant('SGD'))();

  @override
  Set<Column<Object>> get primaryKey => {budgetId, categoryId};
}

@DataClassName('RecurringRuleRecord')
class RecurringRuleRecords extends Table {
  TextColumn get id => text()();
  TextColumn get merchantName => text()();
  IntColumn get amountMinor => integer()();
  TextColumn get currency => text().withDefault(const Constant('SGD'))();
  TextColumn get categoryId => text()();
  TextColumn get cadence => text()();
  DateTimeColumn get nextExpectedAt => dateTime()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('UserRuleRecord')
class UserRuleRecords extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get priority => integer()();
  TextColumn get merchantContains => text().nullable()();
  TextColumn get sourceApp => text().nullable()();
  TextColumn get textContains => text().nullable()();
  TextColumn get categoryId => text().nullable()();
  BoolColumn get markAsTransfer =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get ignore => boolean().withDefault(const Constant(false))();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('RawCaptureRecord')
class RawCaptureRecords extends Table {
  TextColumn get id => text()();
  TextColumn get sourceType => text()();
  TextColumn get sourceApp => text()();
  TextColumn get rawText => text()();
  DateTimeColumn get receivedAt => dateTime()();
  IntColumn get parsedAmountMinor => integer().nullable()();
  TextColumn get parsedMerchant => text().nullable()();
  DateTimeColumn get parsedTimestamp => dateTime().nullable()();
  TextColumn get parserVersion => text()();
  TextColumn get hash => text()();
  TextColumn get status => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('ReviewItemRecord')
class ReviewItemRecords extends Table {
  TextColumn get id => text()();
  TextColumn get rawCaptureId => text()();
  TextColumn get proposedTransactionId => text()();
  TextColumn get reason => text()();
  RealColumn get confidence => real()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get resolvedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('InsightRecord')
class InsightRecords extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get severity => text()();
  TextColumn get supportingTransactionIds => text()();
  TextColumn get suggestedAction => text().nullable()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get dismissedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('PreferenceRecord')
class PreferenceRecords extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

@DriftDatabase(
  tables: [
    TransactionRecords,
    CategoryRecords,
    BudgetRecords,
    CategoryBudgetRecords,
    RecurringRuleRecords,
    UserRuleRecords,
    RawCaptureRecords,
    ReviewItemRecords,
    InsightRecords,
    PreferenceRecords,
  ],
  daos: [
    TransactionDao,
    CategoryDao,
    BudgetDao,
    RuleDao,
    CaptureDao,
    InsightDao,
    PreferenceDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  AppDatabase.defaults() : super(_openConnection());

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'pocket_pulse',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
      ),
      native: const DriftNativeOptions(shareAcrossIsolates: true),
    );
  }

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [TransactionRecords])
class TransactionDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionDaoMixin {
  TransactionDao(super.db);

  Future<List<TransactionRecord>> getAll() {
    final query = select(transactionRecords)
      ..orderBy([(row) => OrderingTerm.desc(row.occurredAt)]);
    return query.get();
  }

  Stream<List<TransactionRecord>> watchAll() {
    final query = select(transactionRecords)
      ..orderBy([(row) => OrderingTerm.desc(row.occurredAt)]);
    return query.watch();
  }

  Future<void> upsert(TransactionRecordsCompanion transaction) {
    return into(transactionRecords).insertOnConflictUpdate(transaction);
  }

  Future<void> upsertAll(List<TransactionRecordsCompanion> rows) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(transactionRecords, rows);
    });
  }

  Future<void> clear() => delete(transactionRecords).go();
}

@DriftAccessor(tables: [CategoryRecords])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<List<CategoryRecord>> getAll() {
    final query = select(categoryRecords)
      ..orderBy([(row) => OrderingTerm.asc(row.sortOrder)]);
    return query.get();
  }

  Future<void> upsertAll(List<CategoryRecordsCompanion> rows) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(categoryRecords, rows);
    });
  }

  Future<void> clear() => delete(categoryRecords).go();
}

@DriftAccessor(tables: [BudgetRecords, CategoryBudgetRecords])
class BudgetDao extends DatabaseAccessor<AppDatabase> with _$BudgetDaoMixin {
  BudgetDao(super.db);

  Future<BudgetRecord?> getActivePlan() {
    final query = select(budgetRecords)
      ..where((row) => row.isActive.equals(true));
    return query.getSingleOrNull();
  }

  Future<List<CategoryBudgetRecord>> getCategoryBudgets(String budgetId) {
    final query = select(categoryBudgetRecords)
      ..where((row) => row.budgetId.equals(budgetId));
    return query.get();
  }

  Future<void> savePlan({
    required BudgetRecordsCompanion plan,
    required List<CategoryBudgetRecordsCompanion> categoryBudgets,
  }) {
    return transaction(() async {
      await into(budgetRecords).insertOnConflictUpdate(plan);
      await (delete(categoryBudgetRecords)
            ..where((row) => row.budgetId.equals(plan.id.value)))
          .go();
      await batch((batch) {
        batch.insertAllOnConflictUpdate(categoryBudgetRecords, categoryBudgets);
      });
    });
  }

  Future<void> clear() {
    return transaction(() async {
      await delete(categoryBudgetRecords).go();
      await delete(budgetRecords).go();
    });
  }
}

@DriftAccessor(tables: [UserRuleRecords, RecurringRuleRecords])
class RuleDao extends DatabaseAccessor<AppDatabase> with _$RuleDaoMixin {
  RuleDao(super.db);

  Future<List<UserRuleRecord>> getUserRules() {
    final query = select(userRuleRecords)
      ..orderBy([(row) => OrderingTerm.asc(row.priority)]);
    return query.get();
  }

  Future<List<RecurringRuleRecord>> getRecurringRules() {
    return select(recurringRuleRecords).get();
  }

  Future<void> upsertUserRules(List<UserRuleRecordsCompanion> rows) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(userRuleRecords, rows);
    });
  }

  Future<void> upsertRecurringRules(
      List<RecurringRuleRecordsCompanion> rows) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(recurringRuleRecords, rows);
    });
  }

  Future<void> clearUserRules() => delete(userRuleRecords).go();
}

@DriftAccessor(tables: [RawCaptureRecords, ReviewItemRecords])
class CaptureDao extends DatabaseAccessor<AppDatabase> with _$CaptureDaoMixin {
  CaptureDao(super.db);

  Future<void> upsertRawCapture(RawCaptureRecordsCompanion row) {
    return into(rawCaptureRecords).insertOnConflictUpdate(row);
  }

  Future<void> upsertReviewItem(ReviewItemRecordsCompanion row) {
    return into(reviewItemRecords).insertOnConflictUpdate(row);
  }

  Future<List<ReviewItemRecord>> getPendingReviewItems() {
    final query = select(reviewItemRecords)
      ..where((row) => row.status.equals('pending'))
      ..orderBy([(row) => OrderingTerm.asc(row.createdAt)]);
    return query.get();
  }
}

@DriftAccessor(tables: [InsightRecords])
class InsightDao extends DatabaseAccessor<AppDatabase> with _$InsightDaoMixin {
  InsightDao(super.db);

  Future<void> upsertAll(List<InsightRecordsCompanion> rows) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(insightRecords, rows);
    });
  }
}

@DriftAccessor(tables: [PreferenceRecords])
class PreferenceDao extends DatabaseAccessor<AppDatabase>
    with _$PreferenceDaoMixin {
  PreferenceDao(super.db);

  Future<String?> read(String key) async {
    final row = await (select(preferenceRecords)
          ..where((row) => row.key.equals(key)))
        .getSingleOrNull();
    return row?.value;
  }

  Future<void> write(String key, String value) {
    return into(preferenceRecords).insertOnConflictUpdate(
      PreferenceRecordsCompanion.insert(
        key: key,
        value: value,
        updatedAt: DateTime.now(),
      ),
    );
  }
}
