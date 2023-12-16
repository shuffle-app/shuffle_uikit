import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitWrappedInputField extends StatefulWidget {
  const UiKitWrappedInputField.uiKitInputFieldNoIcon({
    super.key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.minLines,
    this.maxLines,
    this.enabled = true,
    this.expands = false,
    this.borderRadius,
    this.node,
    this.textInputAction,
    this.onSubmitted,
    this.hintTextColor,
    this.textColor,
    this.keyboardType,
    this.obscureText = false,
  })  : icon = null,
        type = 'uiKitInputFieldNoIcon';

  const UiKitWrappedInputField.uiKitInputFieldRightIcon({
    super.key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.minLines,
    this.maxLines,
    this.enabled = true,
    this.expands = false,
    this.borderRadius,
    this.node,
    this.icon,
    this.textInputAction,
    this.onSubmitted,
    this.hintTextColor,
    this.textColor,
    this.keyboardType,
    this.obscureText = false,
  }) : type = 'uiKitInputFieldRightIcon';

  final TextEditingController controller;
  final bool enabled;
  final String? errorText;
  final String? hintText;
  final String? Function(String? p1)? validator;
  final bool obscureText;

  final ValueChanged<String>? onChanged;

  final Color? fillColor;
  final Color? textColor;

  final int? minLines;
  final int? maxLines;
  final FocusNode? node;
  final void Function(String)? onSubmitted;
  final Color? hintTextColor;
  final BorderRadius? borderRadius;
  final bool expands;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? icon;

  final String type;

  @override
  State<UiKitWrappedInputField> createState() => _UiKitWrappedInputFieldState();
}

class _UiKitWrappedInputFieldState extends State<UiKitWrappedInputField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;

    return UiKitCardWrapper(
        color: uiKitTheme?.colorScheme.surface1,
        borderRadius: (errorText ?? '').isEmpty ? BorderRadiusFoundation.max : BorderRadiusFoundation.all20,
        child: () {
          switch (widget.type) {
            case 'uiKitInputFieldNoIcon':
              return UiKitInputFieldNoIcon(
                controller: widget.controller,
                errorText: errorText,
                hintText: widget.hintText,
                validator: widget.validator,
                onChanged: widget.onChanged,
                fillColor: widget.fillColor,
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                enabled: widget.enabled,
                expands: widget.expands,
                borderRadius: widget.borderRadius,
                node: widget.node,
                textInputAction: widget.textInputAction,
                onSubmitted: widget.onSubmitted,
                hintTextColor: widget.hintTextColor,
                textColor: widget.textColor,
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
              );
            case 'uiKitInputFieldRightIcon':
              return UiKitInputFieldRightIcon(
                obscureText: widget.obscureText,
                enabled: widget.enabled,
                hintText: widget.hintText,
                controller: widget.controller,
                fillColor: widget.fillColor,
                validator: (value) {
                  setState(() {
                    errorText = widget.validator?.call(value);
                  });
                  return errorText;
                },
                icon: widget.icon,
              );
            default:
              return UiKitInputFieldNoFill(
                controller: widget.controller,
                errorText: errorText,
                hintText: widget.hintText,
                validator: widget.validator,
                onChanged: widget.onChanged,
                enabled: widget.enabled,
                expands: widget.expands,
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
                label: '',
              );
          }
        }()
            .paddingAll(EdgeInsetsFoundation.all4));
  }
}
