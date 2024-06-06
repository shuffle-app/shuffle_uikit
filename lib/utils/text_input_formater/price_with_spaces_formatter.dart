import 'package:flutter/services.dart';

class PriceWithSpacesFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(RegExp(r'\s+'), '');

    int decimalPointIndex = newText.indexOf(RegExp(r'[.,]'));
    String integerPart;
    String decimalPart = '';

    if (decimalPointIndex >= 0) {
      integerPart = newText.substring(0, decimalPointIndex);
      decimalPart = newText.substring(decimalPointIndex);
    } else {
      integerPart = newText;
    }

    String formattedIntegerPart = '';
    for (int i = 0; i < integerPart.length; i++) {
      if (i > 0 && (integerPart.length - i) % 3 == 0) {
        formattedIntegerPart += ' ';
      }
      formattedIntegerPart += integerPart[i];
    }

    String formattedText = formattedIntegerPart + decimalPart;

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String formatStringUpdate(String text) {
    return formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: text)).text;
  }
}
