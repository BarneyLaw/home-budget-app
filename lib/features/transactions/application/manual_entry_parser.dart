import '../../../core/money/money.dart';
import '../domain/budget_transaction.dart';

class ManualEntryDraft {
  const ManualEntryDraft({
    required this.amount,
    required this.merchantName,
    required this.categoryId,
    required this.direction,
    this.notes,
  });

  final Money amount;
  final String merchantName;
  final String categoryId;
  final TransactionDirection direction;
  final String? notes;
}

class ManualEntryParser {
  const ManualEntryParser();

  ManualEntryDraft? parse(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    final amountMatch = RegExp(r'(\d+(?:\.\d{1,2})?)').firstMatch(trimmed);
    if (amountMatch == null) {
      return null;
    }

    final amountText = amountMatch.group(1)!;
    final amount = (double.parse(amountText) * 100).round();
    final remainder = trimmed.replaceFirst(amountText, '').trim();
    final lower = trimmed.toLowerCase();
    final direction = lower.startsWith('paid ') ||
            lower.contains(' received ') ||
            lower.startsWith('received ')
        ? TransactionDirection.transfer
        : TransactionDirection.expense;

    final merchantName = remainder
        .replaceFirst(RegExp(r'^(for|at|to)\s+', caseSensitive: false), '')
        .trim();

    return ManualEntryDraft(
      amount: Money(amount),
      merchantName: merchantName.isEmpty ? 'Manual entry' : merchantName,
      categoryId: _inferCategory(merchantName),
      direction: direction,
      notes: trimmed,
    );
  }

  String _inferCategory(String text) {
    final value = text.toLowerCase();
    if (value.contains('grab') ||
        value.contains('bus') ||
        value.contains('train') ||
        value.contains('taxi')) {
      return 'transport';
    }
    if (value.contains('spotify') ||
        value.contains('netflix') ||
        value.contains('icloud')) {
      return 'subscriptions';
    }
    if (value.contains('kopi') ||
        value.contains('coffee') ||
        value.contains('lunch') ||
        value.contains('dinner') ||
        value.contains('canteen')) {
      return 'food';
    }
    if (value.contains('shopee') ||
        value.contains('lazada') ||
        value.contains('amazon')) {
      return 'shopping';
    }
    return 'general';
  }
}
