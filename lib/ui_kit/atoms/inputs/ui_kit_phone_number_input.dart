import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPhoneNumberInput extends StatelessWidget implements BaseUiKitInputField {
  @override
  final TextEditingController controller;
  @override
  final bool enabled;
  @override
  final String? errorText;
  @override
  final String? hintText;
  @override
  final String? Function(String? p1)? validator;

  final String? countryCode;

  final List<TextInputFormatter>? inputFormatters;

  final Color? fillColor;

  UiKitPhoneNumberInput({
    super.key,
    required this.controller,
    required this.enabled,
    this.fillColor,
    this.countryCode,
    this.inputFormatters,
    this.errorText,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    final inputTheme = uiKitTheme?.iconInputTheme;
    final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.error);
    final countryCodeStyle = uiKitTheme?.boldTextTheme.caption1Medium;
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium;
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: enabled ? Colors.white.withOpacity(0.48) : ColorsFoundation.darkNeutral900.withOpacity(0.16),
    );

    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: inputTheme,
        disabledColor: ColorsFoundation.darkNeutral500.withOpacity(0.16),
      ),
      child: TextFormField(
        style: inputTextStyle,
        enabled: enabled,
        controller: enabled ? controller : null,
        validator: validator,
        inputFormatters: [
          ...inputFormatters ?? [],
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          filled: fillColor != null,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          hintText: hintText,
          errorText: errorText,
          errorMaxLines: 1,
          errorStyle: errorStyle,
          hintStyle: hintStyle,
          prefixIcon: Container(
            margin: EdgeInsets.only(right: EdgeInsetsFoundation.horizontal16),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusFoundation.onlyLeft24,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Text(
              countryCode ?? '',
              style: countryCodeStyle,
            ).paddingSymmetric(
              horizontal: EdgeInsetsFoundation.horizontal16,
              vertical: EdgeInsetsFoundation.vertical12,
            ),
          ),
        ),
      ),
    );
  }
}
