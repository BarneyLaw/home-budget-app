import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/features/budget/application/budget_state.dart';
import 'package:home_budget_app/features/transactions/domain/budget_transaction.dart';

void main() {
  test('email receipt import is gated by the Gmail scanning preference', () {
    final controller = BudgetStateController.seeded();
    final before = controller.state.transactions.length;

    final imported = controller.importEmailReceipt(_grabReceipt);

    expect(imported, isFalse);
    expect(controller.state.transactions.length, before);
    expect(controller.state.lastImportMessage,
        'Turn on Gmail receipt scanning first');
  });

  test('imports parsed Gmail receipts as email transactions', () {
    final controller = BudgetStateController.seeded();
    controller.updatePreferences(
      controller.state.preferences.copyWith(emailScanningEnabled: true),
    );

    final imported = controller.importEmailReceipt(_grabReceipt);

    expect(imported, isTrue);
    final transaction = controller.state.transactions.firstWhere(
      (transaction) =>
          transaction.sourceType == TransactionSourceType.email &&
          transaction.sourceApp == 'Gmail',
    );
    expect(transaction.merchantName, 'Grab');
    expect(transaction.amount.minorUnits, 1290);
    expect(transaction.categoryId, 'transport');
    expect(transaction.sourceApp, 'Gmail');
    expect(transaction.notes, startsWith('Email receipt:'));
  });
}

const _grabReceipt = '''
From: Grab Receipts <receipts@grab.com>
Subject: Your receipt from Grab
Date: 2026-06-14
Total SGD 12.90
Thanks for riding with Grab.
''';
