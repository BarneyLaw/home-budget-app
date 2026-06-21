import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/money/money.dart';
import '../../../core/preferences/app_preferences.dart';
import '../../capture/application/capture_pipeline.dart';
import '../../insights/application/insight_generator.dart';
import '../../insights/domain/insight.dart';
import '../../recurring/application/recurring_detector.dart';
import '../../recurring/domain/recurring_payment.dart';
import '../../rules/application/rules_engine.dart';
import '../../rules/domain/rule.dart';
import '../../transactions/application/manual_entry_parser.dart';
import '../../transactions/domain/budget_transaction.dart';
import '../../transactions/domain/category.dart';
import '../data/local_budget_store.dart';
import '../domain/budget_plan.dart';
import 'safe_to_spend_calculator.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase.defaults();
  ref.onDispose(database.close);
  return database;
});

final localBudgetStoreProvider = Provider<LocalBudgetStore>((ref) {
  return LocalBudgetStore(ref.watch(appDatabaseProvider));
});

final budgetStateProvider =
    StateNotifierProvider<BudgetStateController, BudgetState>((ref) {
  final controller = BudgetStateController.seeded(
    store: ref.watch(localBudgetStoreProvider),
  );
  unawaited(controller.hydrate());
  return controller;
});

final safeToSpendProvider = Provider<SafeToSpendResult>((ref) {
  final state = ref.watch(budgetStateProvider);
  return const SafeToSpendCalculator().calculate(
    plan: state.plan,
    transactions: state.transactions,
    now: DateTime.now(),
  );
});

final recurringPaymentsProvider = Provider<List<RecurringPayment>>((ref) {
  final state = ref.watch(budgetStateProvider);
  return const RecurringDetector().detect(state.transactions);
});

final insightsProvider = Provider<List<SpendingInsight>>((ref) {
  final state = ref.watch(budgetStateProvider);
  return const InsightGenerator().generate(state.transactions, DateTime.now());
});

class BudgetState {
  const BudgetState({
    required this.plan,
    required this.categories,
    required this.transactions,
    required this.rules,
    required this.preferences,
    required this.quickEntryText,
    this.lastImportMessage,
  });

  final BudgetPlan plan;
  final List<SpendingCategory> categories;
  final List<BudgetTransaction> transactions;
  final List<TransactionRule> rules;
  final AppPreferences preferences;
  final String quickEntryText;
  final String? lastImportMessage;

  List<BudgetTransaction> get confirmedTransactions => transactions
      .where((transaction) => transaction.status == TransactionStatus.confirmed)
      .toList();

  List<BudgetTransaction> get reviewTransactions => transactions
      .where(
        (transaction) =>
            transaction.status == TransactionStatus.needsReview ||
            transaction.status == TransactionStatus.duplicate,
      )
      .toList();

  List<BudgetTransaction> get todayTransactions {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day);
    return confirmedTransactions
        .where((transaction) => !transaction.occurredAt.isBefore(start))
        .toList();
  }

  List<BudgetTransaction> get periodTransactions {
    return confirmedTransactions.where((transaction) {
      return !transaction.occurredAt.isBefore(plan.periodStart) &&
          transaction.occurredAt.isBefore(plan.periodEnd);
    }).toList();
  }

  SpendingCategory categoryById(String id) {
    return categories.firstWhere(
      (category) => category.id == id,
      orElse: () => categories.last,
    );
  }

  BudgetState copyWith({
    BudgetPlan? plan,
    List<SpendingCategory>? categories,
    List<BudgetTransaction>? transactions,
    List<TransactionRule>? rules,
    AppPreferences? preferences,
    String? quickEntryText,
    String? lastImportMessage,
  }) {
    return BudgetState(
      plan: plan ?? this.plan,
      categories: categories ?? this.categories,
      transactions: transactions ?? this.transactions,
      rules: rules ?? this.rules,
      preferences: preferences ?? this.preferences,
      quickEntryText: quickEntryText ?? this.quickEntryText,
      lastImportMessage: lastImportMessage ?? this.lastImportMessage,
    );
  }

  LocalBudgetSnapshot toSnapshot() {
    return LocalBudgetSnapshot(
      plan: plan,
      categories: categories,
      transactions: transactions,
      rules: rules,
      preferences: preferences,
    );
  }

  factory BudgetState.fromSnapshot(
    LocalBudgetSnapshot snapshot, {
    String quickEntryText = '',
    String? lastImportMessage,
  }) {
    return BudgetState(
      plan: snapshot.plan,
      categories: snapshot.categories,
      transactions: snapshot.transactions,
      rules: snapshot.rules,
      preferences: snapshot.preferences,
      quickEntryText: quickEntryText,
      lastImportMessage: lastImportMessage,
    );
  }
}

class BudgetStateController extends StateNotifier<BudgetState> {
  BudgetStateController(super.state, {LocalBudgetStore? store})
      : _store = store;

  final LocalBudgetStore? _store;

  factory BudgetStateController.seeded({LocalBudgetStore? store}) {
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month);
    final nextMonth = DateTime(now.year, now.month + 1);

    final categories = [
      const SpendingCategory(
        id: 'food',
        name: 'Food',
        color: Color(0xFFEA580C),
        icon: Icons.restaurant_outlined,
      ),
      const SpendingCategory(
        id: 'transport',
        name: 'Transport',
        color: Color(0xFF2563EB),
        icon: Icons.directions_car_outlined,
      ),
      const SpendingCategory(
        id: 'subscriptions',
        name: 'Subscriptions',
        color: Color(0xFF7C3AED),
        icon: Icons.autorenew_outlined,
      ),
      const SpendingCategory(
        id: 'shopping',
        name: 'Shopping',
        color: Color(0xFFDB2777),
        icon: Icons.shopping_bag_outlined,
      ),
      const SpendingCategory(
        id: 'general',
        name: 'General',
        color: Color(0xFF475569),
        icon: Icons.more_horiz,
      ),
    ];

    final transactions = [
      _transaction(
        id: 'txn-kopi',
        amount: const Money(480),
        merchantName: 'Kopi @ Canteen',
        categoryId: 'food',
        occurredAt: now.subtract(const Duration(hours: 3)),
        sourceType: TransactionSourceType.manual,
      ),
      _transaction(
        id: 'txn-grab',
        amount: const Money(1290),
        merchantName: 'Grab',
        categoryId: 'transport',
        occurredAt: now.subtract(const Duration(hours: 6)),
        sourceType: TransactionSourceType.notification,
        sourceApp: 'DBS',
      ),
      _transaction(
        id: 'txn-snack',
        amount: const Money(490),
        merchantName: 'Snack',
        categoryId: 'food',
        occurredAt: now.subtract(const Duration(days: 1, hours: 2)),
        sourceType: TransactionSourceType.manual,
      ),
      _transaction(
        id: 'txn-spotify-current',
        amount: const Money(1999),
        merchantName: 'Spotify',
        categoryId: 'subscriptions',
        occurredAt: now.subtract(const Duration(days: 4)),
        sourceType: TransactionSourceType.email,
        isRecurring: true,
      ),
      _transaction(
        id: 'txn-spotify-previous',
        amount: const Money(1999),
        merchantName: 'Spotify',
        categoryId: 'subscriptions',
        occurredAt: DateTime(now.year, now.month - 1, 10),
        sourceType: TransactionSourceType.email,
        isRecurring: true,
      ),
      _transaction(
        id: 'txn-paynow-review',
        amount: const Money(5000),
        merchantName: 'PayNow to Alex',
        categoryId: 'general',
        occurredAt: now.subtract(const Duration(hours: 1)),
        sourceType: TransactionSourceType.notification,
        sourceApp: 'PayNow',
        status: TransactionStatus.needsReview,
        confidence: 0.51,
        notes: 'Dinner split or transfer?',
      ),
    ];

    final rules = [
      TransactionRule(
        id: 'rule-spotify-subscriptions',
        name: 'Spotify is a subscription',
        priority: 10,
        condition: const RuleCondition(merchantContains: 'spotify'),
        action: const RuleAction(categoryId: 'subscriptions'),
        enabled: true,
        createdAt: now,
        updatedAt: now,
      ),
      TransactionRule(
        id: 'rule-grab-transport',
        name: 'Grab defaults to transport',
        priority: 20,
        condition: const RuleCondition(merchantContains: 'grab'),
        action: const RuleAction(categoryId: 'transport'),
        enabled: true,
        createdAt: now,
        updatedAt: now,
      ),
    ];

    return BudgetStateController(
      BudgetState(
        plan: BudgetPlan(
          id: 'plan-current',
          mode: BudgetMode.simple,
          monthlyLimit: const Money(90000),
          savingsGoal: const Money(30000),
          cashBuffer: const Money(8000),
          fixedBills: const Money(12994),
          categoryBudgets: const [
            CategoryBudget(categoryId: 'food', limit: Money(35000)),
            CategoryBudget(categoryId: 'transport', limit: Money(12000)),
            CategoryBudget(categoryId: 'shopping', limit: Money(20000)),
            CategoryBudget(categoryId: 'subscriptions', limit: Money(10000)),
          ],
          periodStart: monthStart,
          periodEnd: nextMonth,
        ),
        categories: categories,
        transactions: transactions,
        rules: rules,
        preferences: const AppPreferences(onboardingComplete: true),
        quickEntryText: '',
      ),
      store: store,
    );
  }

  static BudgetTransaction _transaction({
    required String id,
    required Money amount,
    required String merchantName,
    required String categoryId,
    required DateTime occurredAt,
    required TransactionSourceType sourceType,
    String accountId = 'cash',
    String? sourceApp,
    bool isRecurring = false,
    TransactionStatus status = TransactionStatus.confirmed,
    double confidence = 0.95,
    String? notes,
  }) {
    final now = DateTime.now();
    return BudgetTransaction(
      id: id,
      amount: amount,
      direction: TransactionDirection.expense,
      merchantName: merchantName,
      categoryId: categoryId,
      accountId: accountId,
      occurredAt: occurredAt,
      capturedAt: now,
      sourceType: sourceType,
      sourceApp: sourceApp,
      confidence: confidence,
      status: status,
      notes: notes,
      isRecurring: isRecurring,
      createdAt: now,
      updatedAt: now,
    );
  }

  Future<void> hydrate() async {
    final store = _store;
    if (store == null) {
      return;
    }

    await store.seedIfEmpty(state.toSnapshot());
    final snapshot = await store.loadSnapshot();
    if (snapshot == null || !mounted) {
      return;
    }

    state = BudgetState.fromSnapshot(
      snapshot,
      quickEntryText: state.quickEntryText,
      lastImportMessage: 'Loaded local budget',
    );
  }

  void setQuickEntryText(String value) {
    state = state.copyWith(quickEntryText: value);
  }

  bool addManualEntry() {
    final draft = const ManualEntryParser().parse(state.quickEntryText);
    if (draft == null) {
      return false;
    }

    final now = DateTime.now();
    final duplicate = _findLikelyDuplicate(
      merchantName: draft.merchantName,
      amount: draft.amount,
      occurredAt: now,
    );
    final transaction = _applyRules(
      BudgetTransaction(
        id: 'manual-${now.microsecondsSinceEpoch}',
        amount: draft.amount,
        direction: draft.direction,
        merchantName: draft.merchantName,
        categoryId: draft.categoryId,
        accountId: 'cash',
        occurredAt: now,
        capturedAt: now,
        sourceType: TransactionSourceType.manual,
        confidence: 0.96,
        status: duplicate == null
            ? TransactionStatus.confirmed
            : TransactionStatus.duplicate,
        notes: duplicate == null
            ? draft.notes
            : 'Likely duplicate of ${duplicate.merchantName}. Original: ${draft.notes}',
        createdAt: now,
        updatedAt: now,
      ),
    );

    state = state.copyWith(
      transactions: [transaction, ...state.transactions],
      quickEntryText: '',
      lastImportMessage: duplicate == null
          ? 'Added ${transaction.merchantName}'
          : 'Possible duplicate needs review',
    );
    _persistSnapshot();
    return true;
  }

  void confirmTransaction(String id) {
    _updateTransaction(
      id,
      (transaction) => transaction.copyWith(
        status: TransactionStatus.confirmed,
        confidence: 1,
        updatedAt: DateTime.now(),
      ),
    );
  }

  void ignoreTransaction(String id) {
    _updateTransaction(
      id,
      (transaction) => transaction.copyWith(
        status: TransactionStatus.ignored,
        updatedAt: DateTime.now(),
      ),
    );
  }

  void markAsTransfer(String id) {
    _updateTransaction(
      id,
      (transaction) => transaction.copyWith(
        direction: TransactionDirection.transfer,
        status: TransactionStatus.confirmed,
        categoryId: 'general',
        confidence: 1,
        updatedAt: DateTime.now(),
      ),
    );
  }

  void changeTransactionCategory(String id, String categoryId) {
    _updateTransaction(
      id,
      (transaction) => transaction.copyWith(
        categoryId: categoryId,
        confidence: 1,
        status: TransactionStatus.confirmed,
        updatedAt: DateTime.now(),
      ),
    );
  }

  void updateTransactionDetails({
    required String id,
    Money? amount,
    String? merchantName,
    String? categoryId,
    DateTime? occurredAt,
    String? notes,
  }) {
    _updateTransaction(
      id,
      (transaction) => transaction.copyWith(
        amount: amount,
        merchantName: merchantName,
        categoryId: categoryId,
        occurredAt: occurredAt,
        notes: notes,
        confidence: 1,
        status: TransactionStatus.confirmed,
        updatedAt: DateTime.now(),
      ),
    );
  }

  bool splitTransaction({
    required String id,
    required Money firstAmount,
    required String firstCategoryId,
    required String secondCategoryId,
  }) {
    BudgetTransaction? original;
    for (final transaction in state.transactions) {
      if (transaction.id == id) {
        original = transaction;
        break;
      }
    }
    if (original == null ||
        firstAmount.minorUnits <= 0 ||
        firstAmount.minorUnits >= original.amount.minorUnits) {
      return false;
    }

    final now = DateTime.now();
    final secondAmount = Money(
      original.amount.minorUnits - firstAmount.minorUnits,
      currency: original.amount.currency,
    );
    final first = original.copyWith(
      amount: firstAmount,
      categoryId: firstCategoryId,
      notes: _appendNote(original.notes, 'Split part 1'),
      confidence: 1,
      status: TransactionStatus.confirmed,
      updatedAt: now,
    );
    final second = original.copyWith(
      id: '${original.id}-split-${now.microsecondsSinceEpoch}',
      amount: secondAmount,
      categoryId: secondCategoryId,
      notes: _appendNote(original.notes, 'Split part 2'),
      createdAt: now,
      updatedAt: now,
    );

    state = state.copyWith(
      transactions: [
        for (final transaction in state.transactions)
          if (transaction.id == id) first else transaction,
        second,
      ]..sort((a, b) => b.occurredAt.compareTo(a.occurredAt)),
      lastImportMessage: 'Transaction split',
    );
    _persistSnapshot();
    return true;
  }

  void mergeDuplicate(String id) {
    _updateTransaction(
      id,
      (transaction) => transaction.copyWith(
        status: TransactionStatus.ignored,
        notes:
            _appendNote(transaction.notes, 'Merged into existing transaction'),
        updatedAt: DateTime.now(),
      ),
    );
  }

  void createRuleFromTransaction(String id) {
    final transaction = state.transactions.firstWhere(
      (item) => item.id == id,
      orElse: () => throw StateError('Transaction not found: $id'),
    );
    final now = DateTime.now();
    final category = state.categoryById(transaction.categoryId);
    final merchantKey = transaction.merchantName.split(' ').first;
    final rule = TransactionRule(
      id: 'rule-${now.microsecondsSinceEpoch}',
      name: '${transaction.merchantName} is ${category.name}',
      priority: 30,
      condition: RuleCondition(merchantContains: merchantKey),
      action: RuleAction(categoryId: transaction.categoryId),
      enabled: true,
      createdAt: now,
      updatedAt: now,
    );

    state = state.copyWith(
      rules: [...state.rules, rule],
      lastImportMessage: 'Rule created for ${transaction.merchantName}',
    );
    _persistRule(rule);
    confirmTransaction(id);
  }

  void simulateNotificationCapture() {
    const sample =
        'DBS: You have spent SGD 12.90 at GRAB SINGAPORE on card ending 1234.';
    final parsed = const CapturePipeline().parseNotification(sample);
    if (parsed == null) {
      return;
    }

    final now = DateTime.now();
    final duplicate = _findLikelyDuplicate(
      merchantName: parsed.merchantName,
      amount: parsed.amount,
      occurredAt: now,
    );
    final status = duplicate != null
        ? TransactionStatus.duplicate
        : parsed.confidence >= 0.75
            ? TransactionStatus.confirmed
            : TransactionStatus.needsReview;

    final transaction = _applyRules(
      BudgetTransaction(
        id: 'capture-${now.microsecondsSinceEpoch}',
        amount: parsed.amount,
        direction: parsed.direction,
        merchantName: parsed.merchantName,
        categoryId: parsed.categoryId,
        accountId: 'dbs-card',
        occurredAt: now,
        capturedAt: now,
        sourceType: TransactionSourceType.notification,
        sourceApp: 'DBS',
        rawSourceId: 'demo-notification',
        confidence: duplicate != null ? 0.98 : parsed.confidence,
        status: status,
        notes:
            duplicate != null ? 'Likely duplicate of ${duplicate.id}' : sample,
        createdAt: now,
        updatedAt: now,
      ),
    );

    state = state.copyWith(
      transactions: [transaction, ...state.transactions],
      lastImportMessage: duplicate != null
          ? 'Captured as duplicate for review'
          : 'Captured ${transaction.merchantName}',
    );
    _persistSnapshot();
  }

  void updatePlan({
    Money? monthlyLimit,
    Money? savingsGoal,
    Money? cashBuffer,
    Money? fixedBills,
    BudgetMode? mode,
  }) {
    state = state.copyWith(
      plan: state.plan.copyWith(
        monthlyLimit: monthlyLimit,
        savingsGoal: savingsGoal,
        cashBuffer: cashBuffer,
        fixedBills: fixedBills,
        mode: mode,
      ),
      lastImportMessage: 'Budget updated',
    );
    _persistSnapshot();
  }

  void updateCategoryBudget(String categoryId, Money limit) {
    final budgets = [
      for (final budget in state.plan.categoryBudgets)
        if (budget.categoryId == categoryId)
          budget.copyWith(limit: limit)
        else
          budget,
    ];
    final hasBudget = budgets.any((budget) => budget.categoryId == categoryId);
    state = state.copyWith(
      plan: state.plan.copyWith(
        categoryBudgets: hasBudget
            ? budgets
            : [
                ...budgets,
                CategoryBudget(categoryId: categoryId, limit: limit)
              ],
      ),
      lastImportMessage: 'Category budget updated',
    );
    _persistSnapshot();
  }

  void updatePreferences(AppPreferences preferences) {
    state = state.copyWith(preferences: preferences);
    _persistPreferences();
  }

  Future<void> resetLocalData() async {
    final seeded = BudgetStateController.seeded(store: _store).state;
    state = seeded.copyWith(lastImportMessage: 'Local data reset');
    final store = _store;
    if (store != null) {
      await store.clearUserData();
      await store.saveSnapshot(state.toSnapshot());
    }
  }

  BudgetTransaction _applyRules(BudgetTransaction transaction) {
    return const RulesEngine().apply(transaction, state.rules);
  }

  BudgetTransaction? _findLikelyDuplicate({
    required String merchantName,
    required Money amount,
    required DateTime occurredAt,
  }) {
    for (final transaction in state.transactions) {
      final sameAmount = transaction.amount.minorUnits == amount.minorUnits;
      final sameMerchant = transaction.merchantName
          .toLowerCase()
          .contains(merchantName.toLowerCase().split(' ').first);
      final closeTime =
          transaction.occurredAt.difference(occurredAt).abs().inHours <= 12;
      if (sameAmount && sameMerchant && closeTime) {
        return transaction;
      }
    }
    return null;
  }

  void _updateTransaction(
    String id,
    BudgetTransaction Function(BudgetTransaction transaction) update,
  ) {
    BudgetTransaction? updatedTransaction;
    state = state.copyWith(
      transactions: [
        for (final transaction in state.transactions)
          if (transaction.id == id)
            updatedTransaction = update(transaction)
          else
            transaction,
      ],
    );
    if (updatedTransaction != null) {
      _persistTransaction(updatedTransaction);
    }
  }

  String _appendNote(String? existing, String note) {
    if (existing == null || existing.isEmpty) {
      return note;
    }
    return '$existing; $note';
  }

  void _persistSnapshot() {
    final store = _store;
    if (store != null) {
      unawaited(store.saveSnapshot(state.toSnapshot()));
    }
  }

  void _persistTransaction(BudgetTransaction transaction) {
    final store = _store;
    if (store != null) {
      unawaited(store.saveTransaction(transaction));
    }
  }

  void _persistRule(TransactionRule rule) {
    final store = _store;
    if (store != null) {
      unawaited(store.saveRule(rule));
    }
  }

  void _persistPreferences() {
    final store = _store;
    if (store != null) {
      unawaited(store.savePreferences(state.preferences));
    }
  }
}
