import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFieldNoIcon extends StatefulWidget implements BaseUiKitInputField {
  const UiKitInputFieldNoIcon({
    Key? key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.onTapOutside,
    this.minLines,
    this.maxLines,
    this.enabled = true,
    this.expands = false,
    this.borderRadius,
    this.node,
    this.customPadding,
    this.textAlign,
    this.textInputAction,
    this.onSubmitted,
    this.hintTextColor,
    this.textColor,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
  }) : super(key: key);

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

  final EdgeInsets? customPadding;
  final TextAlign? textAlign;
  final Color? fillColor;
  final Color? textColor;
  final TapRegionCallback? onTapOutside;
  final int? minLines;
  final int? maxLines;
  final FocusNode? node;
  final void Function(String)? onSubmitted;
  final Color? hintTextColor;
  final BorderRadius? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final bool expands;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  State<UiKitInputFieldNoIcon> createState() => _UiKitInputFieldNoIconState();
}

class _UiKitInputFieldNoIconState extends State<UiKitInputFieldNoIcon> {
  final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    final inputTheme = widget.borderRadius != null
        ? uiKitTheme?.noIconInputTheme.copyWith(
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius!,
              borderSide: BorderSide(
                color: uiKitTheme.colorScheme.inversePrimary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius!, borderSide: BorderSide.none),
          )
        : uiKitTheme?.noIconInputTheme;
    final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.error);
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(
      color: _key.currentState?.hasError ?? false
          ? ColorsFoundation.error
          : widget.textColor ?? uiKitTheme.colorScheme.inversePrimary,
    );
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: widget.enabled
          ? widget.hintTextColor ?? uiKitTheme.colorScheme.inversePrimary.withOpacity(0.48)
          : ColorsFoundation.darkNeutral900.withOpacity(0.16),
    );

    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: inputTheme,
        disabledColor: ColorsFoundation.darkNeutral500.withOpacity(0.16),
      ),
      child: TextFormField(
        key: _key,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        style: inputTextStyle,
        minLines: widget.expands ? null : widget.minLines,
        maxLines: widget.maxLines ?? (widget.expands ? null : (widget.minLines ?? 0) + 1),
        expands: widget.expands,
        controller: widget.enabled ? widget.controller : null,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        focusNode: widget.node,
        keyboardType: widget.keyboardType,
        onTapOutside: widget.onTapOutside,
        obscureText: widget.obscureText,
        onFieldSubmitted: widget.onSubmitted,
        inputFormatters: widget.inputFormatters,
        textAlign: widget.textAlign ?? TextAlign.left,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
          contentPadding: widget.customPadding ?? EdgeInsets.all(EdgeInsetsFoundation.all16),
          errorMaxLines: 1,
          filled: widget.fillColor != null,
          fillColor: widget.fillColor,
          errorStyle: errorStyle,
          hintStyle: hintStyle,
        ),
      ),
    );
  }
}
