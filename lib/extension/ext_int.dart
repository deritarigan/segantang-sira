part of ext;

extension IntExtension on int {
  String formatCurrency(
      {String symbol = 'Rp', String locale = 'id', int decimalDigits = 0}) {
    return NumberFormat.currency(
            locale: locale,
            symbol: symbol,
            decimalDigits: decimalDigits,
            customPattern: '\u00a4 #,##0')
        .format(this);
  }
}
