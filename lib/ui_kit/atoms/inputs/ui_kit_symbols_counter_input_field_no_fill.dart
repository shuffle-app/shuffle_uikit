import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSymbolsCounterInputFieldNoFill extends StatefulWidget
    implements BaseUiKitInputField {
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
  final int maxSymbols;
  final int minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? prefixText;
  final Widget? icon;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
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
  final bool readOnly;
  final TextStyle? inputTextStyle;

  const UiKitSymbolsCounterInputFieldNoFill({
    super.key,
    required this.controller,
    required this.enabled,
    required this.obscureText,
    required this.maxSymbols,
    this.minLines = 5,
    this.errorText,
    this.hintText,
    this.validator,
    this.maxLines,
    this.prefixText,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType,
    this.icon,
    this.contentPadding,
    this.prefixIcon,
    this.customLabelColor,
    this.customHintColor,
    this.customFocusedBorder,
    this.customEnabledBorder,
    this.customInputTextColor,
    this.inputTextStyle,
    this.expands = false,
    this.autofocus = false,
    this.readOnly = false,
  });

  @override
  State<UiKitSymbolsCounterInputFieldNoFill> createState() =>
      _UiKitSymbolsCounterInputFieldNoFillState();
}

class _UiKitSymbolsCounterInputFieldNoFillState
    extends State<UiKitSymbolsCounterInputFieldNoFill> {
  final inputPropertiesColor = const InputStateColor();

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
    final errorStyle = uiKitTheme?.regularTextTheme.caption2
        .copyWith(color: ColorsFoundation.error);
    final inputTextStyle = widget.inputTextStyle ??
        uiKitTheme?.boldTextTheme.labelLarge.copyWith(
            color: _key.currentState?.hasError ?? false
                ? ColorsFoundation.error
                : widget.customInputTextColor ??
                    uiKitTheme.colorScheme.inversePrimary);
    final hintStyle =
        uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: widget.enabled
          ? widget.customHintColor ??
              uiKitTheme.colorScheme.inversePrimary.withOpacity(0.48)
          : ColorsFoundation.darkNeutral900.withOpacity(0.16),
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
        maxLength: widget.maxSymbols,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        buildCounter: _buildCounter,
        decoration: InputDecoration(
          focusedBorder: widget.customFocusedBorder ??
              context.uiKitTheme?.noFillInputTheme.focusedBorder,
          enabledBorder: widget.customEnabledBorder ??
              context.uiKitTheme?.noFillInputTheme.enabledBorder,
          suffixIcon: widget.icon,
          prefixIcon: widget.prefixIcon,
          contentPadding: widget.contentPadding,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          hintText: widget.hintText,
          prefixStyle: inputTextStyle,
          prefixText: widget.prefixText,
          hintStyle: hintStyle,
          errorText: widget.errorText,
          errorMaxLines: 1,
          errorStyle: errorStyle,
        ),
      ),
    );
  }

  Widget _buildCounter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    return Text(
      '$currentLength / $maxLength',
      style: boldTextTheme?.caption2Medium
          .copyWith(color: ColorsFoundation.mutedText),
    );
  }
}
