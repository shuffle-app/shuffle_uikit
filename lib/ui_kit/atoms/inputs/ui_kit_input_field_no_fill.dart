import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit/atoms/inputs/input_field.dart';
import 'package:shuffle_uikit/utils/extentions/context_theme_extension.dart';

import '../../../foundation/colors_foundation.dart';

class UiKitInputFieldNoFill extends StatefulWidget implements UiKitInputField {
  const UiKitInputFieldNoFill({
    Key? key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.validator,
    this.enabled = true,
    required this.label,
  }) : super(key: key);

  final String label;
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

  @override
  State<UiKitInputFieldNoFill> createState() => _UiKitInputFieldNoFillState();
}

class _UiKitInputFieldNoFillState extends State<UiKitInputFieldNoFill> {
  final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _key.currentState?.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    final inputTheme = uiKitTheme?.noFillInputTheme;
    final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.error);
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(
      color: _key.currentState?.hasError ?? false ? ColorsFoundation.error : Colors.white,
    );
    TextStyle? labelStyle = uiKitTheme?.regularTextTheme.labelSmall;
    if (_key.currentState?.hasError ?? false) {
      labelStyle = labelStyle?.copyWith(color: ColorsFoundation.error);
    } else {
      labelStyle = labelStyle?.copyWith(
        color: widget.enabled ? ColorsFoundation.inputLabelGrey : ColorsFoundation.solidGreyText,
      );
    }
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: widget.enabled ? Colors.white.withOpacity(0.48) : ColorsFoundation.solidGreyText.withOpacity(0.16),
    );
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: inputTheme,
        disabledColor: ColorsFoundation.darkNeutral.withOpacity(0.16),
      ),
      child: TextFormField(
        key: _key,
        enabled: widget.enabled,
        controller: widget.enabled ? widget.controller : null,
        style: inputTextStyle,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.label,
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          errorText: widget.errorText,
          errorMaxLines: 1,
          errorStyle: errorStyle,
        ),
      ),
    );
  }
}
