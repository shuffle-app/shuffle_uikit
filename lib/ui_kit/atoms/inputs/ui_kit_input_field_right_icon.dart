import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFieldRightIcon extends StatefulWidget implements BaseUiKitInputField {
  const UiKitInputFieldRightIcon({
    super.key,
    required this.controller,
    this.errorText,
    this.fillColor,
    this.hintText,
    this.validator,
    this.enabled = true,
    this.icon,
    this.onIconPressed,
    this.onTap,
    this.focusNode,
    this.autofocus = false,
    this.expands = false,
    this.onFieldSubmitted,
    this.borderRadius,
    this.obscureText = false,
    this.hintColor,
    this.onChanged,
    this.maxLines = 1,
    this.inputFormatters,
  });

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
  final bool obscureText;

  final ValueChanged<String>? onChanged;
  final Widget? icon;
  final BorderRadius? borderRadius;
  final int maxLines;
  final bool autofocus;
  final bool expands;
  final FocusNode? focusNode;

  final VoidCallback? onIconPressed;
  final VoidCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? fillColor;
  final Color? hintColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<UiKitInputFieldRightIcon> createState() => _UiKitInputFieldRightIconState();
}

class _UiKitInputFieldRightIconState extends State<UiKitInputFieldRightIcon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    final colorScheme = uiKitTheme?.colorScheme;
    final inputTheme = widget.borderRadius != null
        ? uiKitTheme?.iconInputTheme.copyWith(
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius!,
              borderSide: BorderSide(color: colorScheme!.inversePrimary, width: 2),
            ),
            enabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius!, borderSide: BorderSide.none),
          )
        : uiKitTheme?.iconInputTheme;
    final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.error);
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(color: colorScheme?.inversePrimary);
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: widget.enabled
          ? widget.hintColor ?? colorScheme?.inversePrimary.withOpacity(0.48)
          : ColorsFoundation.darkNeutral900.withOpacity(0.16),
    );

    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: inputTheme,
        disabledColor: ColorsFoundation.darkNeutral500.withOpacity(0.16),
      ),
      child: TextFormField(
        expands: widget.expands,
        maxLines: widget.expands ? null : widget.maxLines,
        minLines: widget.expands ? null : 1,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
        enabled: widget.enabled,
        inputFormatters: widget.inputFormatters,
        controller: widget.enabled ? widget.controller : null,
        validator: widget.validator,
        obscureText: widget.obscureText,
        style: inputTextStyle,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          contentPadding: EdgeInsets.all(EdgeInsetsFoundation.all16),
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorStyle: errorStyle,
          errorMaxLines: 3,
          hintStyle: hintStyle,
          suffixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return ColorsFoundation.error;
            }
            return colorScheme?.inversePrimary ?? Colors.white;
          }),
          suffixIcon: widget.icon ??
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: colorScheme?.inversePrimary,
                ),
                onPressed: widget.onIconPressed ??
                    () {
                      widget.controller.clear();
                      widget.onFieldSubmitted?.call(widget.controller.text);
                    },
                visualDensity: VisualDensity.compact,
                splashRadius: 5,
              ),
        ),
      ),
    );
  }
}
