import 'package:intl/intl.dart';

class Money {
  const Money(this.minorUnits, {this.currency = 'SGD'});

  factory Money.fromDecimal(String value, {String currency = 'SGD'}) {
    final normalized = value.trim().replaceAll(',', '');
    final match =
        RegExp(r'^([+-])?(\d+)(?:\.(\d{1,2}))?$').firstMatch(normalized);
    if (match == null) {
      throw FormatException('Invalid money amount', value);
    }

    final sign = match.group(1) == '-' ? -1 : 1;
    final dollars = int.parse(match.group(2)!);
    final centsText = (match.group(3) ?? '').padRight(2, '0');
    final cents = centsText.isEmpty ? 0 : int.parse(centsText);
    return Money(sign * ((dollars * 100) + cents), currency: currency);
  }

  final int minorUnits;
  final String currency;

  Money operator +(Money other) => Money(
        minorUnits + other.minorUnits,
        currency: currency,
      );

  Money operator -(Money other) => Money(
        minorUnits - other.minorUnits,
        currency: currency,
      );

  bool get isNegative => minorUnits < 0;

  String toDecimalString() {
    final sign = minorUnits < 0 ? '-' : '';
    final absolute = minorUnits.abs();
    final major = absolute ~/ 100;
    final cents = (absolute % 100).toString().padLeft(2, '0');
    return '$sign$major.$cents';
  }

  String format({bool compact = false}) {
    final currencyFormatter = NumberFormat.simpleCurrency(name: currency);
    final numberFormatter = NumberFormat.decimalPattern();
    final sign = minorUnits < 0 ? '-' : '';
    final absolute = minorUnits.abs();
    final major = absolute ~/ 100;
    final cents = absolute % 100;
    final symbol = currencyFormatter.currencySymbol;

    if (compact && minorUnits % 100 == 0) {
      return '$sign$symbol${numberFormatter.format(major)}';
    }
    return '$sign$symbol${numberFormatter.format(major)}.${cents.toString().padLeft(2, '0')}';
  }
}
