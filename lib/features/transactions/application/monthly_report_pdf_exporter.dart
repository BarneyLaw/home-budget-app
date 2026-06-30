import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/money/money.dart';
import '../../budget/domain/budget_plan.dart';
import '../domain/budget_transaction.dart';
import '../domain/category.dart';

class MonthlyReportPdfExporter {
  const MonthlyReportPdfExporter();

  Future<Uint8List> export({
    required BudgetPlan plan,
    required List<BudgetTransaction> transactions,
    required List<SpendingCategory> categories,
    required DateTime generatedAt,
  }) async {
    final document = pw.Document(
      title: 'PocketPulse monthly report',
      author: 'PocketPulse',
      creator: 'PocketPulse',
    );
    final categoryNames = {
      for (final category in categories) category.id: category.name,
    };
    final periodTransactions = transactions
        .where(
          (transaction) =>
              transaction.status == TransactionStatus.confirmed &&
              !transaction.occurredAt.isBefore(plan.periodStart) &&
              transaction.occurredAt.isBefore(plan.periodEnd),
        )
        .toList()
      ..sort((a, b) => b.occurredAt.compareTo(a.occurredAt));

    final expenseMinor = _sumByDirection(
      periodTransactions,
      TransactionDirection.expense,
    );
    final incomeMinor = _sumByDirection(
      periodTransactions,
      TransactionDirection.income,
    );
    final committedMinor = plan.savingsGoal.minorUnits +
        plan.fixedBills.minorUnits +
        plan.cashBuffer.minorUnits;
    final discretionaryLimit = Money(
      plan.monthlyLimit.minorUnits - committedMinor,
      currency: plan.monthlyLimit.currency,
    );
    final remaining = discretionaryLimit - Money(expenseMinor);
    final categoryRows = _categoryRows(
      transactions: periodTransactions,
      categories: categories,
      plan: plan,
    );

    document.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) {
          return [
            pw.Text(
              'PocketPulse monthly report',
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              '${DateFormat.yMMMd().format(plan.periodStart)} - ${DateFormat.yMMMd().format(plan.periodEnd.subtract(const Duration(days: 1)))}',
              style: const pw.TextStyle(color: PdfColors.grey700),
            ),
            pw.Text(
              'Generated ${DateFormat.yMMMd().add_jm().format(generatedAt)}',
              style: const pw.TextStyle(color: PdfColors.grey700),
            ),
            pw.SizedBox(height: 20),
            _sectionTitle('Summary'),
            _summaryTable(
              rows: [
                ['Monthly spend limit', plan.monthlyLimit.format()],
                ['Savings goal', plan.savingsGoal.format()],
                ['Fixed bills', plan.fixedBills.format()],
                ['Cash buffer', plan.cashBuffer.format()],
                ['Discretionary limit', discretionaryLimit.format()],
                ['Confirmed expenses', Money(expenseMinor).format()],
                ['Confirmed income', Money(incomeMinor).format()],
                ['Remaining discretionary', remaining.format()],
              ],
            ),
            pw.SizedBox(height: 20),
            _sectionTitle('Category budgets'),
            if (categoryRows.isEmpty)
              pw.Text('No category spending recorded for this period.')
            else
              pw.TableHelper.fromTextArray(
                headers: ['Category', 'Spent', 'Limit', 'Remaining'],
                data: categoryRows,
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headerDecoration: const pw.BoxDecoration(
                  color: PdfColors.grey200,
                ),
                cellAlignment: pw.Alignment.centerLeft,
                cellStyle: const pw.TextStyle(fontSize: 10),
                border: pw.TableBorder.all(color: PdfColors.grey300),
              ),
            pw.SizedBox(height: 20),
            _sectionTitle('Transactions'),
            if (periodTransactions.isEmpty)
              pw.Text('No confirmed transactions recorded for this period.')
            else
              pw.TableHelper.fromTextArray(
                headers: ['Date', 'Purpose', 'Category', 'Amount', 'Status'],
                data: [
                  for (final transaction in periodTransactions.take(40))
                    [
                      DateFormat.MMMd().format(transaction.occurredAt),
                      transaction.merchantName,
                      categoryNames[transaction.categoryId] ??
                          transaction.categoryId,
                      _signedAmount(transaction),
                      transaction.status.name,
                    ],
                ],
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headerDecoration: const pw.BoxDecoration(
                  color: PdfColors.grey200,
                ),
                cellAlignment: pw.Alignment.centerLeft,
                cellStyle: const pw.TextStyle(fontSize: 9),
                border: pw.TableBorder.all(color: PdfColors.grey300),
              ),
            if (periodTransactions.length > 40) ...[
              pw.SizedBox(height: 8),
              pw.Text(
                '${periodTransactions.length - 40} additional transactions omitted from this compact report.',
                style:
                    const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
              ),
            ],
          ];
        },
      ),
    );

    return document.save();
  }

  int _sumByDirection(
    List<BudgetTransaction> transactions,
    TransactionDirection direction,
  ) {
    return transactions
        .where((transaction) => transaction.direction == direction)
        .fold<int>(
          0,
          (sum, transaction) => sum + transaction.amount.minorUnits,
        );
  }

  List<List<String>> _categoryRows({
    required List<BudgetTransaction> transactions,
    required List<SpendingCategory> categories,
    required BudgetPlan plan,
  }) {
    final spentByCategory = <String, int>{};
    for (final transaction in transactions.where(
      (transaction) => transaction.direction == TransactionDirection.expense,
    )) {
      spentByCategory.update(
        transaction.categoryId,
        (value) => value + transaction.amount.minorUnits,
        ifAbsent: () => transaction.amount.minorUnits,
      );
    }

    final budgetByCategory = {
      for (final budget in plan.categoryBudgets)
        budget.categoryId: budget.limit,
    };
    final rows = <List<String>>[];
    for (final category in categories) {
      final spent = Money(spentByCategory[category.id] ?? 0);
      final limit = budgetByCategory[category.id] ?? const Money(0);
      if (spent.minorUnits == 0 && limit.minorUnits == 0) {
        continue;
      }
      final remaining = limit - spent;
      rows.add([
        category.name,
        spent.format(),
        limit.format(),
        remaining.format(),
      ]);
    }
    return rows;
  }

  String _signedAmount(BudgetTransaction transaction) {
    final sign =
        transaction.direction == TransactionDirection.income ? '+' : '';
    return '$sign${transaction.amount.format()}';
  }
}

pw.Widget _sectionTitle(String title) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 8),
    child: pw.Text(
      title,
      style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
    ),
  );
}

pw.Widget _summaryTable({required List<List<String>> rows}) {
  return pw.TableHelper.fromTextArray(
    data: rows,
    cellAlignment: pw.Alignment.centerLeft,
    cellStyle: const pw.TextStyle(fontSize: 10),
    border: pw.TableBorder.all(color: PdfColors.grey300),
    oddRowDecoration: const pw.BoxDecoration(color: PdfColors.grey100),
  );
}
