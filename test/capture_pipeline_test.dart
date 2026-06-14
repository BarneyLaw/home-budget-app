import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/features/capture/application/capture_pipeline.dart';
import 'package:home_budget_app/features/transactions/domain/budget_transaction.dart';

void main() {
  group('CapturePipeline', () {
    test('parses bank notification amount and merchant', () {
      final parsed = const CapturePipeline().parseNotification(
        'DBS: You have spent SGD 12.90 at GRAB SINGAPORE on card ending 1234.',
      );

      expect(parsed, isNotNull);
      expect(parsed!.amount.minorUnits, 1290);
      expect(parsed.merchantName, 'Grab Singapore');
      expect(parsed.categoryId, 'transport');
      expect(parsed.direction, TransactionDirection.expense);
      expect(parsed.confidence, greaterThan(0.8));
    });

    test('classifies received notifications as income', () {
      final parsed = const CapturePipeline().parseNotification(
        'DBS: You received SGD 50.00 from Alex.',
      );

      expect(parsed, isNotNull);
      expect(parsed!.direction, TransactionDirection.income);
    });
  });
}
