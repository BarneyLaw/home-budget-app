import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/features/transactions/application/manual_entry_parser.dart';
import 'package:home_budget_app/features/transactions/domain/budget_transaction.dart';

void main() {
  group('ManualEntryParser', () {
    test('parses amount, merchant, and inferred food category', () {
      final draft = const ManualEntryParser().parse('4.80 kopi');

      expect(draft, isNotNull);
      expect(draft!.amount.minorUnits, 480);
      expect(draft.merchantName, 'kopi');
      expect(draft.categoryId, 'food');
      expect(draft.direction, TransactionDirection.expense);
    });

    test('marks paid entries as transfers', () {
      final draft = const ManualEntryParser().parse('paid alex 20 dinner');

      expect(draft, isNotNull);
      expect(draft!.amount.minorUnits, 2000);
      expect(draft.direction, TransactionDirection.transfer);
    });

    test('returns null when there is no amount', () {
      expect(const ManualEntryParser().parse('kopi'), isNull);
    });
  });
}
