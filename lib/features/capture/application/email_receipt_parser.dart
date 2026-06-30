import 'package:intl/intl.dart';

import '../../../core/money/money.dart';

class ParsedEmailReceipt {
  const ParsedEmailReceipt({
    required this.amount,
    required this.merchantName,
    required this.categoryId,
    required this.occurredAt,
    required this.confidence,
    required this.summary,
  });

  final Money amount;
  final String merchantName;
  final String categoryId;
  final DateTime occurredAt;
  final double confidence;
  final String summary;
}

class EmailReceiptParser {
  const EmailReceiptParser();

  ParsedEmailReceipt? parse(String rawEmail, {DateTime? now}) {
    final text = rawEmail.trim();
    if (text.isEmpty) {
      return null;
    }

    final amount = _amountFromText(text);
    if (amount == null) {
      return null;
    }

    final merchantName = _merchantFromText(text);
    final occurredAt = _dateFromText(text) ?? now ?? DateTime.now();
    final categoryId = _categoryForMerchant(merchantName, text);
    final confidence = merchantName == 'Unknown merchant' ? 0.58 : 0.86;

    return ParsedEmailReceipt(
      amount: amount,
      merchantName: merchantName,
      categoryId: categoryId,
      occurredAt: occurredAt,
      confidence: confidence,
      summary: _summaryFromText(text),
    );
  }

  Money? _amountFromText(String text) {
    final targeted = RegExp(
      r'(?:total|amount paid|grand total|charged|paid)\D{0,24}(?:SGD|\$)?\s?(\d+(?:\.\d{1,2})?)',
      caseSensitive: false,
    ).firstMatch(text);
    final fallback = RegExp(
      r'(?:SGD|\$)\s?(\d+(?:\.\d{1,2})?)',
      caseSensitive: false,
    ).firstMatch(text);
    final match = targeted ?? fallback;
    if (match == null) {
      return null;
    }
    return Money.fromDecimal(match.group(1)!);
  }

  String _merchantFromText(String text) {
    final patterns = [
      RegExp(
        r'(?:subject:\s*)?(?:your\s+)?receipt\s+from\s+([^\n\r-]+)',
        caseSensitive: false,
      ),
      RegExp(
        r'(?:merchant|store|vendor):\s*([^\n\r]+)',
        caseSensitive: false,
      ),
      RegExp(
        r'thanks\s+for\s+(?:shopping|ordering)\s+(?:with|at|from)\s+([^\n\r.]+)',
        caseSensitive: false,
      ),
      RegExp(
        r'from:\s*"?([^"<\n\r]+)',
        caseSensitive: false,
      ),
    ];

    for (final pattern in patterns) {
      final match = pattern.firstMatch(text);
      if (match == null) {
        continue;
      }
      final merchant = _cleanMerchant(match.group(1)!);
      if (merchant.isNotEmpty) {
        return merchant;
      }
    }

    final lower = text.toLowerCase();
    if (lower.contains('grab')) {
      return 'Grab';
    }
    if (lower.contains('spotify')) {
      return 'Spotify';
    }
    if (lower.contains('netflix')) {
      return 'Netflix';
    }
    return 'Unknown merchant';
  }

  DateTime? _dateFromText(String text) {
    final isoMatch = RegExp(
      r'(?:date|transaction date|order date):\s*(\d{4}-\d{2}-\d{2})',
      caseSensitive: false,
    ).firstMatch(text);
    if (isoMatch != null) {
      return DateTime.tryParse(isoMatch.group(1)!);
    }

    final namedDateMatch = RegExp(
      r'(?:date|transaction date|order date):\s*([A-Z][a-z]{2,8}\s+\d{1,2},\s+\d{4})',
      caseSensitive: false,
    ).firstMatch(text);
    if (namedDateMatch != null) {
      return _tryParseDate(namedDateMatch.group(1)!, 'MMM d, yyyy') ??
          _tryParseDate(namedDateMatch.group(1)!, 'MMMM d, yyyy');
    }

    final inlineDateMatch = RegExp(
      r'\bon\s+(\d{1,2}\s+[A-Z][a-z]{2,8}\s+\d{4})',
      caseSensitive: false,
    ).firstMatch(text);
    if (inlineDateMatch != null) {
      return _tryParseDate(inlineDateMatch.group(1)!, 'd MMM yyyy') ??
          _tryParseDate(inlineDateMatch.group(1)!, 'd MMMM yyyy');
    }

    return null;
  }

  DateTime? _tryParseDate(String value, String pattern) {
    try {
      return DateFormat(pattern).parseStrict(value);
    } on FormatException {
      return null;
    }
  }

  String _categoryForMerchant(String merchantName, String text) {
    final haystack = '$merchantName $text'.toLowerCase();
    if (haystack.contains('grab') ||
        haystack.contains('taxi') ||
        haystack.contains('ride')) {
      return 'transport';
    }
    if (haystack.contains('spotify') ||
        haystack.contains('netflix') ||
        haystack.contains('subscription')) {
      return 'subscriptions';
    }
    if (haystack.contains('restaurant') ||
        haystack.contains('coffee') ||
        haystack.contains('cafe') ||
        haystack.contains('lunch') ||
        haystack.contains('dinner')) {
      return 'food';
    }
    if (haystack.contains('shop') ||
        haystack.contains('order') ||
        haystack.contains('store')) {
      return 'shopping';
    }
    return 'general';
  }

  String _summaryFromText(String text) {
    return text
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .take(28)
        .join(' ');
  }

  String _cleanMerchant(String value) {
    return value
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(
            RegExp(r'\s*(receipt|support|orders?)$', caseSensitive: false), '')
        .replaceAll(RegExp(r'[-|].*$'), '')
        .trim()
        .split(' ')
        .map((word) {
      if (word.isEmpty) {
        return word;
      }
      final lower = word.toLowerCase();
      if (lower.length <= 3 && word == word.toUpperCase()) {
        return word;
      }
      return '${lower.substring(0, 1).toUpperCase()}${lower.substring(1)}';
    }).join(' ');
  }
}
