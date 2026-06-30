import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/core/money/money.dart';
import 'package:home_budget_app/features/budget/application/budget_state.dart';
import 'package:home_budget_app/features/transactions/domain/budget_transaction.dart';

void main() {
  test('adds a structured manual transaction with explicit details', () {
    final controller = BudgetStateController.seeded();
    final occurredAt = DateTime(2026, 6, 14);

    final added = controller.addStructuredTransaction(
      amount: const Money(1250),
      direction: TransactionDirection.expense,
      merchantName: 'Lunch set',
      categoryId: 'food',
      occurredAt: occurredAt,
      accountId: 'card',
      notes: 'Quantity: 2; Paid with: Card',
    );

    expect(added, isTrue);
    final transaction = controller.state.transactions.firstWhere(
      (transaction) => transaction.merchantName == 'Lunch set',
    );
    expect(transaction.merchantName, 'Lunch set');
    expect(transaction.amount.minorUnits, 1250);
    expect(transaction.categoryId, 'food');
    expect(transaction.accountId, 'card');
    expect(transaction.occurredAt, occurredAt);
    expect(transaction.sourceType, TransactionSourceType.manual);
    expect(transaction.status, TransactionStatus.confirmed);
    expect(transaction.notes, contains('Quantity: 2'));
  });

  test('rejects structured entries without an amount or purpose', () {
    final controller = BudgetStateController.seeded();
    final before = controller.state.transactions.length;

    final added = controller.addStructuredTransaction(
      amount: const Money(0),
      direction: TransactionDirection.expense,
      merchantName: '',
      categoryId: 'food',
      occurredAt: DateTime(2026, 6, 14),
    );

    expect(added, isFalse);
    expect(controller.state.transactions.length, before);
  });
}
