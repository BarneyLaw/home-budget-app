import '../../transactions/domain/budget_transaction.dart';
import '../domain/recurring_payment.dart';

class RecurringDetector {
  const RecurringDetector();

  List<RecurringPayment> detect(List<BudgetTransaction> transactions) {
    final byMerchant = <String, List<BudgetTransaction>>{};
    for (final transaction in transactions.where(
      (item) =>
          item.status == TransactionStatus.confirmed &&
          item.direction == TransactionDirection.expense,
    )) {
      byMerchant
          .putIfAbsent(transaction.merchantName.toLowerCase(), () => [])
          .add(transaction);
    }

    return byMerchant.entries
        .where((entry) => entry.value.length >= 2)
        .map((entry) {
      final sorted = [...entry.value]
        ..sort((a, b) => b.occurredAt.compareTo(a.occurredAt));
      final latest = sorted.first;
      return RecurringPayment(
        id: 'recurring-${entry.key}',
        merchantName: latest.merchantName,
        amount: latest.amount,
        categoryId: latest.categoryId,
        cadence: 'monthly',
        nextExpectedAt: DateTime(
          latest.occurredAt.year,
          latest.occurredAt.month + 1,
          latest.occurredAt.day,
        ),
      );
    }).toList();
  }
}
