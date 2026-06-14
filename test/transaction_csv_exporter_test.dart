import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/core/money/money.dart';
import 'package:home_budget_app/features/transactions/application/transaction_csv_exporter.dart';
import 'package:home_budget_app/features/transactions/domain/budget_transaction.dart';
import 'package:home_budget_app/features/transactions/domain/category.dart';

void main() {
  test('exports transactions as escaped CSV', () {
    final now = DateTime(2026, 6, 14, 8);
    final csv = const TransactionCsvExporter().export(
      categories: const [
        SpendingCategory(
          id: 'food',
          name: 'Food',
          color: Colors.orange,
          icon: Icons.restaurant,
        ),
      ],
      transactions: [
        BudgetTransaction(
          id: 'txn-1',
          amount: const Money(480),
          direction: TransactionDirection.expense,
          merchantName: 'Kopi, Canteen',
          categoryId: 'food',
          accountId: 'cash',
          occurredAt: now,
          capturedAt: now,
          sourceType: TransactionSourceType.manual,
          confidence: 1,
          status: TransactionStatus.confirmed,
          notes: 'morning "coffee"',
          createdAt: now,
          updatedAt: now,
        ),
      ],
    );

    expect(csv, contains('"Kopi, Canteen"'));
    expect(csv, contains('"morning ""coffee"""'));
    expect(csv, contains('4.80'));
  });
}
