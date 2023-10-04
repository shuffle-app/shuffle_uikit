import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPhoneNumberInput extends StatefulWidget implements BaseUiKitInputField {
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
  State<UiKitPhoneNumberInput> createState() => _UiKitPhoneNumberInputState();
}

class _UiKitPhoneNumberInputState extends State<UiKitPhoneNumberInput> {
  final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    final inputTheme = uiKitTheme?.iconInputTheme;
    final color = _key.currentState?.hasError ?? false ? ColorsFoundation.error : Colors.white;
    final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.error);
    final countryCodeStyle = uiKitTheme?.boldTextTheme.caption1Medium;
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(color: color);
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: widget.enabled ? Colors.white.withOpacity(0.48) : ColorsFoundation.darkNeutral900.withOpacity(0.16),
    );

    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: inputTheme,
        disabledColor: ColorsFoundation.darkNeutral500.withOpacity(0.16),
      ),
      child: TextFormField(
        key: _key,
        style: inputTextStyle,
        enabled: widget.enabled,
        controller: widget.enabled ? widget.controller : null,
        validator: widget.validator,
        inputFormatters: [
          ...widget.inputFormatters ?? [],
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          filled: widget.fillColor != null,
          fillColor: widget.fillColor,
          contentPadding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorMaxLines: 1,
          errorStyle: errorStyle,
          hintStyle: hintStyle,
          prefixIcon: Container(
            margin: EdgeInsets.only(right: EdgeInsetsFoundation.horizontal16),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusFoundation.onlyLeft24,
              border: Border.all(color: color, width: 2),
            ),
            child: Text(
              widget.countryCode ?? '',
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
