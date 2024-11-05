import 'package:flutter/services.dart';

class PriceWithSpacesFormatter extends TextInputFormatter {
  final bool allowDecimal;
  final int maxDecimalPlaces;
  final String? currency;

  PriceWithSpacesFormatter({
    this.allowDecimal = true,
    this.maxDecimalPlaces = 2,
    this.currency,
  });

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'[^\d.,]'), '');
    String formattedText = '';

    if (newText.startsWith('.') || newText.startsWith(',')) {
      newText = '';
    }

    if (newText.startsWith('0') && !newText.startsWith('0.') && !newText.startsWith('0,') && newText.length > 1) {
      newText = newText.substring(1);
    }

    if (allowDecimal) {
      int firstDecimalPointIndex = newText.indexOf(RegExp(r'[.,]'));
      if (firstDecimalPointIndex >= 0) {
        String beforeDecimal = newText.substring(0, firstDecimalPointIndex + 1);
        String afterDecimal = newText.substring(firstDecimalPointIndex + 1).replaceAll(RegExp(r'[.,]'), '');

        if (afterDecimal.length > maxDecimalPlaces) {
          afterDecimal = afterDecimal.substring(0, maxDecimalPlaces);
        }

        newText = beforeDecimal + afterDecimal;
      }
    } else {
      newText = newText.replaceAll(RegExp(r'[.,]'), '');
    }

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

    formattedText = formattedIntegerPart + decimalPart;

    int newOffset = formattedText.length;

    if (currency != null && currency!.isNotEmpty) {
      if (!formattedText.endsWith(' ${currency}')) {
        formattedText += ' ${currency}';
        newOffset = formattedText.length - 4;
      }
    }
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newOffset),
    );
  }

  String formatStringUpdate(String text) {
    return formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: text)).text.replaceMultipleDotsAndCommas();
  }
}

extension StringExtension on String {
  String replaceMultipleDotsAndCommas() {
    return replaceAll(RegExp(r'[.,]'), '.');
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension StringFormater on String {
  String removeTrailingDecimal() {
    if (endsWith('.') || endsWith(',')) {
      return substring(0, length - 1);
    }
    return this;
  }
}
