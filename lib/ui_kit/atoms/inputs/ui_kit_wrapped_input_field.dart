import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitWrappedInputField extends StatefulWidget {
  const UiKitWrappedInputField.uiKitInputFieldNoIcon({
    super.key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.minLines,
    this.maxLines,
    this.enabled = true,
    this.expands = false,
    this.borderRadius,
    this.node,
    this.label,
    this.textInputAction,
    this.onSubmitted,
    this.hintTextColor,
    this.textColor,
    this.keyboardType,
    this.obscureText = false,
  })  : icon = null,
        onIconPressed = null,
        type = 'uiKitInputFieldNoIcon';

  const UiKitWrappedInputField.uiKitInputFieldRightIcon({
    super.key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.inputFormatters,
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
    this.label,
    this.textInputAction,
    this.onSubmitted,
    this.hintTextColor,
    this.textColor,
    this.keyboardType,
    this.onIconPressed,
    this.obscureText = false,
  }) : type = 'uiKitInputFieldRightIcon';

  final TextEditingController controller;
  final bool enabled;
  final String? errorText;
  final String? hintText;
  final String? Function(String? p1)? validator;
  final bool obscureText;
  final VoidCallback? onIconPressed;

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
  final Widget? label;
  final List<TextInputFormatter>? inputFormatters;

  final String type;

  @override
  State<UiKitWrappedInputField> createState() => _UiKitWrappedInputFieldState();
}

class _UiKitWrappedInputFieldState extends State<UiKitWrappedInputField> {
  String? errorText;

  @override
  void initState() {
    super.initState();
    errorText = widget.errorText;
  }

  @override
  void didUpdateWidget(covariant UiKitWrappedInputField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.errorText != widget.errorText) {
      setState(() {
        errorText = widget.errorText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;

    return UiKitCardWrapper(
        color: uiKitTheme?.colorScheme.surface1,
        borderRadius: (errorText ?? '').isEmpty
            ? widget.label != null
                ? BorderRadiusFoundation.all24
                : BorderRadiusFoundation.max
            : BorderRadiusFoundation.all20,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min, children: [
          if (widget.label != null)
            widget.label!.paddingLTRB(SpacingFoundation.horizontalSpacing16, SpacingFoundation.verticalSpacing12,
                SpacingFoundation.horizontalSpacing16, SpacingFoundation.verticalSpacing2),
          () {
            switch (widget.type) {
              case 'uiKitInputFieldNoIcon':
                return UiKitInputFieldNoIcon(
                  controller: widget.controller,
                  errorText: errorText,
                  hintText: widget.hintText,
                  validator: (value) {
                    setState(() {
                      errorText = widget.validator?.call(value);
                    });
                    return errorText;
                  },
                  onChanged: widget.onChanged,
                  fillColor: widget.fillColor,
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  enabled: widget.enabled,
                  expands: widget.expands,
                  borderRadius: widget.borderRadius,
                  node: widget.node,
                  inputFormatters: widget.inputFormatters,
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
                  inputFormatters: widget.inputFormatters,
                  icon: widget.icon,
                  onIconPressed: widget.onIconPressed,
                );
              default:
                return UiKitInputFieldNoFill(
                  controller: widget.controller,
                  errorText: errorText,
                  hintText: widget.hintText,
                  validator: (value) {
                    setState(() {
                      errorText = widget.validator?.call(value);
                    });
                    return errorText;
                  },
                  inputFormatters: widget.inputFormatters,
                  onChanged: widget.onChanged,
                  enabled: widget.enabled,
                  expands: widget.expands,
                  keyboardType: widget.keyboardType,
                  obscureText: widget.obscureText,
                  label: '',
                );
            }
          }()
              .paddingAll(EdgeInsetsFoundation.all4)
        ]));
  }
}
