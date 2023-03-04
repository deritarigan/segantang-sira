part of formatter;

class CurrencyRupiahInputFormatter extends TextInputFormatter {
  CurrencyRupiahInputFormatter({required this.maxDigits, this.prefix});

  final int maxDigits;
  final String? prefix;

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = '';

    if (newValue.selection.baseOffset > maxDigits) {
      return oldValue;
    }
    if (newValue.selection.baseOffset == 0) {
      newText = "0".formatCurrency(symbol: prefix);
    } else {
      newText = newValue.text.formatCurrency(symbol: prefix);
    }
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
