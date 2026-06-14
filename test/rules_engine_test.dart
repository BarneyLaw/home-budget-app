import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/core/money/money.dart';
import 'package:home_budget_app/features/rules/application/rules_engine.dart';
import 'package:home_budget_app/features/rules/domain/rule.dart';
import 'package:home_budget_app/features/transactions/domain/budget_transaction.dart';

void main() {
  test('applies the first matching category rule', () {
    final now = DateTime(2026, 6, 14);
    final transaction = BudgetTransaction(
      id: 'txn',
      amount: const Money(1290),
      direction: TransactionDirection.expense,
      merchantName: 'Grab Singapore',
      categoryId: 'general',
      accountId: 'card',
      occurredAt: now,
      capturedAt: now,
      sourceType: TransactionSourceType.notification,
      confidence: 0.7,
      status: TransactionStatus.needsReview,
      createdAt: now,
      updatedAt: now,
    );

    final updated = const RulesEngine().apply(
      transaction,
      [
        TransactionRule(
          id: 'rule-grab',
          name: 'Grab transport',
          priority: 10,
          condition: const RuleCondition(merchantContains: 'grab'),
          action: const RuleAction(categoryId: 'transport'),
          enabled: true,
          createdAt: now,
          updatedAt: now,
        ),
      ],
    );

    expect(updated.categoryId, 'transport');
  });
}
