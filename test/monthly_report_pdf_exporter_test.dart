import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/core/money/money.dart';
import 'package:home_budget_app/features/budget/domain/budget_plan.dart';
import 'package:home_budget_app/features/transactions/application/monthly_report_pdf_exporter.dart';
import 'package:home_budget_app/features/transactions/domain/budget_transaction.dart';
import 'package:home_budget_app/features/transactions/domain/category.dart';

void main() {
  test('generates a valid monthly PDF document', () async {
    final now = DateTime(2026, 6, 14, 8);
    final bytes = await const MonthlyReportPdfExporter().export(
      generatedAt: now,
      plan: BudgetPlan(
        id: 'plan',
        mode: BudgetMode.simple,
        monthlyLimit: const Money(90000),
        savingsGoal: const Money(10000),
        cashBuffer: const Money(5000),
        fixedBills: const Money(20000),
        categoryBudgets: const [
          CategoryBudget(categoryId: 'food', limit: Money(30000)),
        ],
        periodStart: DateTime(2026, 6),
        periodEnd: DateTime(2026, 7),
      ),
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
          merchantName: 'Kopi',
          categoryId: 'food',
          accountId: 'cash',
          occurredAt: now,
          capturedAt: now,
          sourceType: TransactionSourceType.manual,
          confidence: 1,
          status: TransactionStatus.confirmed,
          createdAt: now,
          updatedAt: now,
        ),
      ],
    );

    expect(String.fromCharCodes(bytes.take(4)), '%PDF');
    expect(bytes.length, greaterThan(1000));
  });
}
