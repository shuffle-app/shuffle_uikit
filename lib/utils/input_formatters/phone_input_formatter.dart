import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PhoneInputFormatter extends TextInputFormatter {
  final CountryModel country;

  PhoneInputFormatter({required this.country});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final mask = country.phoneMask;

    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length && mask[newValue.text.length - 1] == '-') {
          return TextEditingValue(
            text: '${oldValue.text}-${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }

    return newValue;
  }
}
