import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/money/money.dart';
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
import '../domain/budget_plan.dart';
import 'safe_to_spend_calculator.dart';

final budgetStateProvider =
    StateNotifierProvider<BudgetStateController, BudgetState>((ref) {
  return BudgetStateController.seeded();
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
    required this.quickEntryText,
    this.lastImportMessage,
  });

  final BudgetPlan plan;
  final List<SpendingCategory> categories;
  final List<BudgetTransaction> transactions;
  final List<TransactionRule> rules;
  final String quickEntryText;
  final String? lastImportMessage;

  List<BudgetTransaction> get confirmedTransactions => transactions
      .where((transaction) => transaction.status == TransactionStatus.confirmed)
      .toList();

  List<BudgetTransaction> get reviewTransactions => transactions
      .where((transaction) => transaction.status == TransactionStatus.needsReview)
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
    String? quickEntryText,
    String? lastImportMessage,
  }) {
    return BudgetState(
      plan: plan ?? this.plan,
      categories: categories ?? this.categories,
      transactions: transactions ?? this.transactions,
      rules: rules ?? this.rules,
      quickEntryText: quickEntryText ?? this.quickEntryText,
      lastImportMessage: lastImportMessage ?? this.lastImportMessage,
    );
  }
}

class BudgetStateController extends StateNotifier<BudgetState> {
  BudgetStateController(super.state);

  factory BudgetStateController.seeded() {
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
        quickEntryText: '',
      ),
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

  void setQuickEntryText(String value) {
    state = state.copyWith(quickEntryText: value);
  }

  bool addManualEntry() {
    final draft = const ManualEntryParser().parse(state.quickEntryText);
    if (draft == null) {
      return false;
    }

    final now = DateTime.now();
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
        status: TransactionStatus.confirmed,
        notes: draft.notes,
        createdAt: now,
        updatedAt: now,
      ),
    );

    state = state.copyWith(
      transactions: [transaction, ...state.transactions],
      quickEntryText: '',
      lastImportMessage: 'Added ${transaction.merchantName}',
    );
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
    state = state.copyWith(
      transactions: [
        for (final transaction in state.transactions)
          if (transaction.id == id) update(transaction) else transaction,
      ],
    );
  }
}
