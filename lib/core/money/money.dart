import 'package:intl/intl.dart';

class Money {
  const Money(this.minorUnits, {this.currency = 'SGD'});

  final int minorUnits;
  final String currency;

  double get amount => minorUnits / 100;

  Money operator +(Money other) => Money(
        minorUnits + other.minorUnits,
        currency: currency,
      );

  Money operator -(Money other) => Money(
        minorUnits - other.minorUnits,
        currency: currency,
      );

  bool get isNegative => minorUnits < 0;

  String format({bool compact = false}) {
    final formatter = NumberFormat.simpleCurrency(name: currency);
    if (compact && minorUnits % 100 == 0) {
      return formatter.format(minorUnits ~/ 100);
    }
    return formatter.format(amount);
  }
}
