import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFieldNoFill extends StatefulWidget implements BaseUiKitInputField {
  const UiKitInputFieldNoFill({
    Key? key,
    required this.controller,
    this.errorText,
    this.inputFormatters,
    this.prefixText,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.customLabelColor,
    this.customHintColor,
    this.customFocusedBorder,
    this.customEnabledBorder,
    this.customInputTextColor,
    this.enabled = true,
    this.expands = false,
    this.autofocus = false,
    this.obscureText = false,
    required this.label,
  }) : super(key: key);

  final String label;
  final TextInputType? keyboardType;
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

  final String? prefixText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;
  final Color? customLabelColor;
  final Color? customHintColor;
  final Color? customInputTextColor;
  final InputBorder? customFocusedBorder;
  final InputBorder? customEnabledBorder;
  final bool expands;
  final bool autofocus;
  @override
  final bool obscureText;

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
        color: _key.currentState?.hasError ?? false
            ? ColorsFoundation.error
            : widget.customInputTextColor ?? uiKitTheme.colorScheme.inversePrimary);
    TextStyle? labelStyle = uiKitTheme?.regularTextTheme.labelSmall;
    labelStyle = _key.currentState?.hasError ?? false
        ? labelStyle?.copyWith(color: ColorsFoundation.error)
        : labelStyle?.copyWith(
            color: widget.enabled
                ? widget.customLabelColor ?? uiKitTheme?.colorScheme.bodyTypography
                : uiKitTheme?.colorScheme.darkNeutral900);
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: widget.enabled
          ? widget.customHintColor ?? uiKitTheme.colorScheme.inversePrimary.withOpacity(0.48)
          : ColorsFoundation.darkNeutral900.withOpacity(0.16),
    );

    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: inputTheme,
        disabledColor: ColorsFoundation.darkNeutral500.withOpacity(0.16),
      ),
      child: TextFormField(
        key: _key,
        onTap: widget.onTap,
        obscureText: widget.obscureText,
        textInputAction: TextInputAction.next,
        expands: widget.expands,
        maxLines: widget.expands ? null : 1,
        enabled: widget.enabled,
        autofocus: widget.autofocus,
        keyboardType: widget.keyboardType,
        controller: widget.enabled ? widget.controller : null,
        style: inputTextStyle,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          focusedBorder: widget.customFocusedBorder ?? context.uiKitTheme?.noFillInputTheme.focusedBorder,
          enabledBorder: widget.customEnabledBorder ?? context.uiKitTheme?.noFillInputTheme.enabledBorder,
          suffixIcon: widget.suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) => labelStyle!),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          labelStyle: MaterialStateTextStyle.resolveWith((states) => labelStyle!),
          hintText: widget.hintText,
          prefixStyle: inputTextStyle,
          prefixText: widget.prefixText,
          labelText: widget.label,
          hintStyle: hintStyle,
          errorText: widget.errorText,
          errorMaxLines: 1,
          errorStyle: errorStyle,
        ),
      ),
    );
  }
}
