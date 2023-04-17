part of ext;

extension StringExtension on String {
  String capitalize() => length > 0
      ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
      : toUpperCase();

  String formatCurrency(
      {String? symbol, String locale = 'id', int decimalDigits = 0}) {
    double newValue = double.parse(this);
    final formatter = NumberFormat.currency(
        locale: locale,
        symbol: symbol ?? 'Rp',
        decimalDigits: decimalDigits,
        customPattern: '\u00a4 #,##0');

    return formatter.format(newValue);
  }

  int formatCurrencyNumber() {
    String cleanPrice = replaceAll('Rp', '');
    cleanPrice = cleanPrice.replaceAll(' ', '');
    cleanPrice = cleanPrice.replaceAll('.', '');
    try {
      return int.parse(cleanPrice);
    } catch (e) {
      return -1;
    }
  }

  String trimLeadingZero() {
    for (int i = 0; i < length; i++) {
      if (this[i] != '0') {
        return substring(i);
      }
    }
    return '';
  }

  String changeFormatDate(
      {String inputFormat = serverDateFormat,
      String outPutFormat = clientDateFormat,
      bool isUtc = false}) {
    String result = '-';
    try {
      final DateFormat dateFormatInput = DateFormat(inputFormat);
      final DateFormat dateFormatOutput = DateFormat(outPutFormat);
      final DateTime time = dateFormatInput.parse(this, isUtc).toLocal();
      result = dateFormatOutput.format(time);
    } catch (e) {
      log('ERROR::CHANGE_DATE_FORMAT => $e');
    }
    return result;
  }

  bool validateIsUrl() {
    return Uri.parse(this).isAbsolute;
  }
}
