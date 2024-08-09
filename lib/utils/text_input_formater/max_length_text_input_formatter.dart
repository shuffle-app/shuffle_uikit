import 'package:flutter/services.dart';

class MaxLengthTextInputFormatter extends TextInputFormatter {
  final int maxLength;

  MaxLengthTextInputFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > maxLength) {
      return oldValue;
    }
    return newValue;
  }
}
