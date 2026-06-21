import '../../../core/money/money.dart';
import '../../transactions/domain/budget_transaction.dart';

class ParsedCapture {
  const ParsedCapture({
    required this.amount,
    required this.currency,
    required this.merchantName,
    required this.direction,
    required this.categoryId,
    required this.confidence,
  });

  final Money amount;
  final String currency;
  final String merchantName;
  final TransactionDirection direction;
  final String categoryId;
  final double confidence;
}

class CapturePipeline {
  const CapturePipeline();

  ParsedCapture? parseNotification(String text) {
    final amountMatch =
        RegExp(r'(?:SGD|\$)\s?(\d+(?:\.\d{1,2})?)', caseSensitive: false)
            .firstMatch(text);
    if (amountMatch == null) {
      return null;
    }

    final amount = Money.fromDecimal(amountMatch.group(1)!);
    final lower = text.toLowerCase();
    final merchant = _merchantFromText(text);
    final isIncome = lower.contains('received') || lower.contains('credited');
    final isTransfer = lower.contains('transfer') || lower.contains('paynow');
    final direction = isIncome
        ? TransactionDirection.income
        : isTransfer
            ? TransactionDirection.transfer
            : TransactionDirection.expense;

    final categoryId = _categoryForMerchant(merchant);
    final confidence = merchant == 'Unknown merchant' ? 0.46 : 0.84;

    return ParsedCapture(
      amount: amount,
      currency: 'SGD',
      merchantName: merchant,
      direction: direction,
      categoryId: categoryId,
      confidence: confidence,
    );
  }

  String _merchantFromText(String text) {
    final atMatch = RegExp(
      r'\bat\s+([A-Z0-9 &.-]+?)(?:\s+on\s+card|\s+on\s+\d|\s*$)',
      caseSensitive: false,
    ).firstMatch(text.toUpperCase());
    if (atMatch != null) {
      return _titleCase(atMatch.group(1)!.trim());
    }
    if (text.toLowerCase().contains('grab')) {
      return 'Grab';
    }
    if (text.toLowerCase().contains('spotify')) {
      return 'Spotify';
    }
    return 'Unknown merchant';
  }

  String _categoryForMerchant(String merchant) {
    final lower = merchant.toLowerCase();
    if (lower.contains('grab')) {
      return 'transport';
    }
    if (lower.contains('spotify') || lower.contains('netflix')) {
      return 'subscriptions';
    }
    return 'general';
  }

  String _titleCase(String value) {
    return value
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .map((word) => word.isEmpty
            ? word
            : '${word.substring(0, 1).toUpperCase()}${word.substring(1)}')
        .join(' ');
  }
}
