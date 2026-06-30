import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/features/capture/application/email_receipt_parser.dart';

void main() {
  test('parses Gmail receipt text into a transaction draft', () {
    final receipt = const EmailReceiptParser().parse(
      '''
From: Grab Receipts <receipts@grab.com>
Subject: Your receipt from Grab
Date: 2026-06-14
Total SGD 12.90
Thanks for riding with Grab.
''',
      now: DateTime(2026, 6, 30),
    );

    expect(receipt, isNotNull);
    expect(receipt!.merchantName, 'Grab');
    expect(receipt.amount.minorUnits, 1290);
    expect(receipt.categoryId, 'transport');
    expect(receipt.occurredAt, DateTime(2026, 6, 14));
    expect(receipt.confidence, greaterThan(0.8));
  });

  test('returns null when a receipt has no amount', () {
    final receipt = const EmailReceiptParser().parse(
      'Subject: Your receipt from Grab\nNo payment total included.',
      now: DateTime(2026, 6, 30),
    );

    expect(receipt, isNull);
  });
}
