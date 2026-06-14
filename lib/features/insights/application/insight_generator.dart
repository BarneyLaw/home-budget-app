import '../../../core/money/money.dart';
import '../../recurring/application/recurring_detector.dart';
import '../../transactions/domain/budget_transaction.dart';
import '../domain/insight.dart';

class InsightGenerator {
  const InsightGenerator({this.recurringDetector = const RecurringDetector()});

  final RecurringDetector recurringDetector;

  List<SpendingInsight> generate(
    List<BudgetTransaction> transactions,
    DateTime now,
  ) {
    final confirmedExpenses = transactions.where(
      (transaction) =>
          transaction.status == TransactionStatus.confirmed &&
          transaction.direction == TransactionDirection.expense,
    );
    final smallPurchases = confirmedExpenses
        .where((transaction) => transaction.amount.minorUnits <= 600)
        .toList();
    final recurring = recurringDetector.detect(transactions);

    final insights = <SpendingInsight>[];
    if (smallPurchases.length >= 3) {
      final total = smallPurchases.fold<int>(
        0,
        (sum, transaction) => sum + transaction.amount.minorUnits,
      );
      insights.add(
        SpendingInsight(
          id: 'small-purchases',
          type: 'small_purchase_leak',
          title: 'Small purchases are adding up',
          description:
              'You spent ${Money(total).format()} on purchases under ${const Money(600).format()} this week.',
          severity: InsightSeverity.info,
          supportingTransactionIds:
              smallPurchases.map((transaction) => transaction.id).toList(),
          suggestedAction: 'Review small purchases',
          status: 'active',
          createdAt: now,
        ),
      );
    }

    if (recurring.isNotEmpty) {
      final total = recurring.fold<int>(
        0,
        (sum, payment) => sum + payment.amount.minorUnits,
      );
      insights.add(
        SpendingInsight(
          id: 'subscriptions',
          type: 'recurring_total',
          title: 'Recurring payments detected',
          description:
              '${recurring.length} likely recurring payments total ${Money(total).format()}/month.',
          severity: InsightSeverity.warning,
          supportingTransactionIds: const [],
          suggestedAction: 'Open subscriptions',
          status: 'active',
          createdAt: now,
        ),
      );
    }

    return insights;
  }
}
