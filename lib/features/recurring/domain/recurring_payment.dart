import '../../../core/money/money.dart';

class RecurringPayment {
  const RecurringPayment({
    required this.id,
    required this.merchantName,
    required this.amount,
    required this.categoryId,
    required this.cadence,
    required this.nextExpectedAt,
  });

  final String id;
  final String merchantName;
  final Money amount;
  final String categoryId;
  final String cadence;
  final DateTime nextExpectedAt;
}
