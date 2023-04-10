import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/colors_foundation.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';
import 'package:shuffle_uikit/ui_kit/atoms/inputs/input_field.dart';

class UiKitInputFieldRightIcon extends UiKitInputField {
  const UiKitInputFieldRightIcon({
    Key? key,
    required super.controller,
    super.errorText,
    super.hintText,
    super.validator,
    super.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final inputTheme = Theme.of(context).extension<UiKitThemeData>()?.iconInputTheme;
        return Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: inputTheme,
            disabledColor: ColorsFoundation.darkNeutral.withOpacity(0.16),
          ),
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            validator: validator,
            style: Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.caption1Medium.copyWith(color: Colors.white),
            decoration: InputDecoration(
              hintText: hintText,
              errorText: errorText,
              hintStyle: Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.caption1UpperCaseMedium.copyWith(
                    color: enabled ? Colors.white.withOpacity(0.48) : ColorsFoundation.solidGreyText.withOpacity(0.16),
                  ),
              suffixIconColor: Colors.white,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: enabled ? Colors.white : ColorsFoundation.solidGreyText,
                ),
                onPressed: () {
                  controller.clear();
                },
                visualDensity: VisualDensity.compact,
                splashRadius: 5,
              ),
            ),
          ),
        );
      },
    );
  }
}
