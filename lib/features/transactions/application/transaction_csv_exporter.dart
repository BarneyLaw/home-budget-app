import '../domain/budget_transaction.dart';
import '../domain/category.dart';

class TransactionCsvExporter {
  const TransactionCsvExporter();

  String export({
    required List<BudgetTransaction> transactions,
    required List<SpendingCategory> categories,
  }) {
    final categoryNames = {
      for (final category in categories) category.id: category.name,
    };
    final rows = [
      [
        'id',
        'occurred_at',
        'amount',
        'currency',
        'direction',
        'merchant',
        'category',
        'source_type',
        'source_app',
        'status',
        'confidence',
        'notes',
      ],
      ...transactions.map((transaction) {
        return [
          transaction.id,
          transaction.occurredAt.toIso8601String(),
          transaction.amount.amount.toStringAsFixed(2),
          transaction.amount.currency,
          transaction.direction.name,
          transaction.merchantName,
          categoryNames[transaction.categoryId] ?? transaction.categoryId,
          transaction.sourceType.name,
          transaction.sourceApp ?? '',
          transaction.status.name,
          transaction.confidence.toStringAsFixed(2),
          transaction.notes ?? '',
        ];
      }),
    ];

    return rows.map((row) => row.map(_escape).join(',')).join('\n');
  }

  String _escape(String value) {
    final needsQuotes =
        value.contains(',') || value.contains('"') || value.contains('\n');
    final escaped = value.replaceAll('"', '""');
    return needsQuotes ? '"$escaped"' : escaped;
  }
}
