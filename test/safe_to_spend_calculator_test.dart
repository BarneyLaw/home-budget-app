import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/core/money/money.dart';
import 'package:home_budget_app/features/budget/application/safe_to_spend_calculator.dart';
import 'package:home_budget_app/features/budget/domain/budget_plan.dart';
import 'package:home_budget_app/features/transactions/domain/budget_transaction.dart';

void main() {
  test('safe-to-spend subtracts commitments and confirmed expenses', () {
    final now = DateTime(2026, 6, 14, 12);
    final plan = BudgetPlan(
      id: 'plan',
      mode: BudgetMode.simple,
      monthlyLimit: const Money(90000),
      savingsGoal: const Money(30000),
      cashBuffer: const Money(8000),
      fixedBills: const Money(12000),
      categoryBudgets: const [],
      periodStart: DateTime(2026, 6),
      periodEnd: DateTime(2026, 7),
    );
    final transaction = BudgetTransaction(
      id: 'txn',
      amount: const Money(10000),
      direction: TransactionDirection.expense,
      merchantName: 'Groceries',
      categoryId: 'food',
      accountId: 'cash',
      occurredAt: now,
      capturedAt: now,
      sourceType: TransactionSourceType.manual,
      confidence: 1,
      status: TransactionStatus.confirmed,
      createdAt: now,
      updatedAt: now,
    );

    final result = const SafeToSpendCalculator().calculate(
      plan: plan,
      transactions: [transaction],
      now: now,
    );

    expect(result.spentToday.minorUnits, 10000);
    expect(result.remainingAfterCommitments.minorUnits, 30000);
    expect(result.safeThisWeek.minorUnits, greaterThan(0));
    expect(result.safeThisWeek.minorUnits, lessThanOrEqualTo(30000));
  });
}
