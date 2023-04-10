import 'package:flutter/material.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';
import 'package:shuffle_uikit/ui_kit/atoms/inputs/input_field.dart';

class UiKitInputFieldRightIcon extends UiKitInputField {
  const UiKitInputFieldRightIcon({
    Key? key,
    required super.controller,
    super.errorText,
    super.hintText,
    super.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final inputTheme = Theme.of(context).extension<UiKitThemeData>()?.iconInputTheme;
        return Theme(
          data: Theme.of(context).copyWith(inputDecorationTheme: inputTheme),
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              errorText: errorText,
              suffixIcon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
