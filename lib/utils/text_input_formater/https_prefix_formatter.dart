import 'package:flutter/services.dart';

class HttpsPrefixFormatter extends TextInputFormatter {
  final String prefix = 'https://';

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (oldValue.text.startsWith(prefix) && !newValue.text.startsWith(prefix)) {
      return newValue.copyWith(
        text: '',
        selection: TextSelection.fromPosition(
          const TextPosition(offset: ''.length),
        ),
      );
    }

    if (newValue.text.startsWith(prefix)) {
      return newValue;
    }

    final newText = prefix + newValue.text;

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newText.length),
      ),
    );
  }
}
