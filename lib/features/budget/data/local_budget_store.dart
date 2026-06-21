import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../../core/database/app_database.dart';
import '../../../core/money/money.dart';
import '../../../core/preferences/app_preferences.dart';
import '../../rules/domain/rule.dart';
import '../../transactions/domain/budget_transaction.dart';
import '../../transactions/domain/category.dart';
import '../domain/budget_plan.dart';

class LocalBudgetSnapshot {
  const LocalBudgetSnapshot({
    required this.plan,
    required this.categories,
    required this.transactions,
    required this.rules,
    required this.preferences,
  });

  final BudgetPlan plan;
  final List<SpendingCategory> categories;
  final List<BudgetTransaction> transactions;
  final List<TransactionRule> rules;
  final AppPreferences preferences;
}

class LocalBudgetStore {
  const LocalBudgetStore(this.database);

  static const _preferencesKey = 'app_preferences';

  final AppDatabase database;

  Future<void> seedIfEmpty(LocalBudgetSnapshot defaults) async {
    final activePlan = await database.budgetDao.getActivePlan();
    if (activePlan != null) {
      return;
    }
    await saveSnapshot(defaults);
  }

  Future<LocalBudgetSnapshot?> loadSnapshot() async {
    final planRecord = await database.budgetDao.getActivePlan();
    if (planRecord == null) {
      return null;
    }

    final categoryRecords = await database.categoryDao.getAll();
    final transactionRecords = await database.transactionDao.getAll();
    final categoryBudgetRecords =
        await database.budgetDao.getCategoryBudgets(planRecord.id);
    final ruleRecords = await database.ruleDao.getUserRules();
    final rawPreferences = await database.preferenceDao.read(_preferencesKey);

    return LocalBudgetSnapshot(
      plan: _planFromRecord(planRecord, categoryBudgetRecords),
      categories: categoryRecords.map(_categoryFromRecord).toList(),
      transactions: transactionRecords.map(_transactionFromRecord).toList(),
      rules: ruleRecords.map(_ruleFromRecord).toList(),
      preferences: rawPreferences == null
          ? const AppPreferences()
          : AppPreferences.fromJson(
              jsonDecode(rawPreferences) as Map<String, dynamic>,
            ),
    );
  }

  Future<void> saveSnapshot(LocalBudgetSnapshot snapshot) async {
    await database.transaction(() async {
      await database.categoryDao.upsertAll(
        [
          for (var index = 0; index < snapshot.categories.length; index++)
            _categoryToCompanion(snapshot.categories[index], index),
        ],
      );
      await database.budgetDao.savePlan(
        plan: _planToCompanion(snapshot.plan),
        categoryBudgets: [
          for (final categoryBudget in snapshot.plan.categoryBudgets)
            _categoryBudgetToCompanion(snapshot.plan.id, categoryBudget),
        ],
      );
      await database.transactionDao.upsertAll(
        snapshot.transactions.map(_transactionToCompanion).toList(),
      );
      await database.ruleDao.clearUserRules();
      await database.ruleDao.upsertUserRules(
        snapshot.rules.map(_ruleToCompanion).toList(),
      );
      await database.preferenceDao.write(
        _preferencesKey,
        jsonEncode(snapshot.preferences.toJson()),
      );
    });
  }

  Future<void> saveTransaction(BudgetTransaction transaction) {
    return database.transactionDao.upsert(_transactionToCompanion(transaction));
  }

  Future<void> saveRule(TransactionRule rule) {
    return database.ruleDao.upsertUserRules([_ruleToCompanion(rule)]);
  }

  Future<void> savePreferences(AppPreferences preferences) {
    return database.preferenceDao.write(
      _preferencesKey,
      jsonEncode(preferences.toJson()),
    );
  }

  Future<void> clearUserData() async {
    await database.transaction(() async {
      await database.transactionDao.clear();
      await database.ruleDao.clearUserRules();
      await database.budgetDao.clear();
      await database.categoryDao.clear();
      await database.preferenceDao.write(
        _preferencesKey,
        jsonEncode(const AppPreferences().toJson()),
      );
    });
  }

  BudgetPlan _planFromRecord(
    BudgetRecord record,
    List<CategoryBudgetRecord> categoryBudgets,
  ) {
    return BudgetPlan(
      id: record.id,
      mode: _enumByName(BudgetMode.values, record.mode, BudgetMode.simple),
      monthlyLimit: Money(
        record.monthlyLimitMinor,
        currency: record.currency,
      ),
      savingsGoal: Money(record.savingsGoalMinor, currency: record.currency),
      cashBuffer: Money(record.cashBufferMinor, currency: record.currency),
      fixedBills: Money(record.fixedBillsMinor, currency: record.currency),
      categoryBudgets: categoryBudgets
          .map(
            (row) => CategoryBudget(
              categoryId: row.categoryId,
              limit: Money(row.limitMinor, currency: row.currency),
            ),
          )
          .toList(),
      periodStart: record.periodStart,
      periodEnd: record.periodEnd,
    );
  }

  SpendingCategory _categoryFromRecord(CategoryRecord record) {
    return SpendingCategory(
      id: record.id,
      name: record.name,
      color: Color(record.colorValue),
      icon: _iconForCategory(record.id),
    );
  }

  BudgetTransaction _transactionFromRecord(TransactionRecord record) {
    return BudgetTransaction(
      id: record.id,
      amount: Money(record.amountMinor, currency: record.currency),
      direction: _enumByName(
        TransactionDirection.values,
        record.direction,
        TransactionDirection.expense,
      ),
      merchantName: record.merchantName,
      categoryId: record.categoryId,
      accountId: record.accountId,
      occurredAt: record.occurredAt,
      capturedAt: record.capturedAt,
      sourceType: _enumByName(
        TransactionSourceType.values,
        record.sourceType,
        TransactionSourceType.manual,
      ),
      sourceApp: record.sourceApp,
      rawSourceId: record.rawSourceId,
      confidence: record.confidence,
      status: _enumByName(
        TransactionStatus.values,
        record.status,
        TransactionStatus.needsReview,
      ),
      notes: record.notes,
      isRecurring: record.isRecurring,
      createdAt: record.createdAt,
      updatedAt: record.updatedAt,
    );
  }

  TransactionRule _ruleFromRecord(UserRuleRecord record) {
    return TransactionRule(
      id: record.id,
      name: record.name,
      priority: record.priority,
      condition: RuleCondition(
        merchantContains: record.merchantContains,
        sourceApp: record.sourceApp,
        textContains: record.textContains,
      ),
      action: RuleAction(
        categoryId: record.categoryId,
        markAsTransfer: record.markAsTransfer,
        ignore: record.ignore,
      ),
      enabled: record.enabled,
      createdAt: record.createdAt,
      updatedAt: record.updatedAt,
    );
  }

  BudgetRecordsCompanion _planToCompanion(BudgetPlan plan) {
    final now = DateTime.now();
    return BudgetRecordsCompanion.insert(
      id: plan.id,
      mode: plan.mode.name,
      monthlyLimitMinor: plan.monthlyLimit.minorUnits,
      savingsGoalMinor: plan.savingsGoal.minorUnits,
      cashBufferMinor: plan.cashBuffer.minorUnits,
      fixedBillsMinor: plan.fixedBills.minorUnits,
      currency: Value(plan.monthlyLimit.currency),
      periodStart: plan.periodStart,
      periodEnd: plan.periodEnd,
      createdAt: now,
      updatedAt: now,
    );
  }

  CategoryBudgetRecordsCompanion _categoryBudgetToCompanion(
    String budgetId,
    CategoryBudget categoryBudget,
  ) {
    return CategoryBudgetRecordsCompanion.insert(
      budgetId: budgetId,
      categoryId: categoryBudget.categoryId,
      limitMinor: categoryBudget.limit.minorUnits,
      currency: Value(categoryBudget.limit.currency),
    );
  }

  CategoryRecordsCompanion _categoryToCompanion(
    SpendingCategory category,
    int sortOrder,
  ) {
    return CategoryRecordsCompanion.insert(
      id: category.id,
      name: category.name,
      colorValue: _colorToArgb(category.color),
      iconCodePoint: category.icon.codePoint,
      sortOrder: Value(sortOrder),
    );
  }

  TransactionRecordsCompanion _transactionToCompanion(
    BudgetTransaction transaction,
  ) {
    return TransactionRecordsCompanion.insert(
      id: transaction.id,
      amountMinor: transaction.amount.minorUnits,
      currency: Value(transaction.amount.currency),
      direction: transaction.direction.name,
      merchantName: transaction.merchantName,
      categoryId: transaction.categoryId,
      accountId: transaction.accountId,
      occurredAt: transaction.occurredAt,
      capturedAt: transaction.capturedAt,
      sourceType: transaction.sourceType.name,
      confidence: transaction.confidence,
      status: transaction.status.name,
      createdAt: transaction.createdAt,
      updatedAt: transaction.updatedAt,
      normalizedMerchantId: Value(_normalizeMerchant(transaction.merchantName)),
      sourceApp: Value(transaction.sourceApp),
      rawSourceId: Value(transaction.rawSourceId),
      notes: Value(transaction.notes),
      isRecurring: Value(transaction.isRecurring),
    );
  }

  UserRuleRecordsCompanion _ruleToCompanion(TransactionRule rule) {
    return UserRuleRecordsCompanion.insert(
      id: rule.id,
      name: rule.name,
      priority: rule.priority,
      enabled: Value(rule.enabled),
      createdAt: rule.createdAt,
      updatedAt: rule.updatedAt,
      merchantContains: Value(rule.condition.merchantContains),
      sourceApp: Value(rule.condition.sourceApp),
      textContains: Value(rule.condition.textContains),
      categoryId: Value(rule.action.categoryId),
      markAsTransfer: Value(rule.action.markAsTransfer),
      ignore: Value(rule.action.ignore),
    );
  }

  T _enumByName<T extends Enum>(List<T> values, String name, T fallback) {
    for (final value in values) {
      if (value.name == name) {
        return value;
      }
    }
    return fallback;
  }

  String _normalizeMerchant(String value) {
    return value
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '');
  }

  int _colorToArgb(Color color) {
    return (color.a * 255).round() << 24 |
        (color.r * 255).round() << 16 |
        (color.g * 255).round() << 8 |
        (color.b * 255).round();
  }

  IconData _iconForCategory(String id) {
    return switch (id) {
      'food' => Icons.restaurant_outlined,
      'transport' => Icons.directions_car_outlined,
      'subscriptions' => Icons.autorenew_outlined,
      'shopping' => Icons.shopping_bag_outlined,
      _ => Icons.more_horiz,
    };
  }
}
