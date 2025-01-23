import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSymbolsCounterInputField extends StatefulWidget implements BaseUiKitInputField {
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
  final FocusNode? focusNode;
  final VoidCallback? onTap;

  const UiKitSymbolsCounterInputField({
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
    this.focusNode,
    this.onTap,
  });

  @override
  State<UiKitSymbolsCounterInputField> createState() => _UiKitSymbolsCounterInputFieldState();
}

class _UiKitSymbolsCounterInputFieldState extends State<UiKitSymbolsCounterInputField> {
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
    final inputTheme = uiKitTheme?.noIconInputBorderRadius20;
    final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.error);
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(
      color: (_key.currentState?.hasError ?? false) ? ColorsFoundation.error : Colors.white,
    );
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: widget.enabled
          ? uiKitTheme.colorScheme.inversePrimary.withOpacity(0.48)
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
        onTap: widget.onTap,
        enabled: widget.enabled,
        focusNode: widget.focusNode,
        controller: widget.enabled ? widget.controller : null,
        validator: widget.validator,
        maxLength: widget.maxSymbols,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        buildCounter: _buildCounter,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorMaxLines: 1,
          filled: widget.enabled,
          fillColor: uiKitTheme?.colorScheme.surface3,
          errorStyle: errorStyle,
          hintMaxLines: 3,
          hintStyle: hintStyle,
          prefixIconColor: inputPropertiesColor,
          contentPadding: EdgeInsets.all(EdgeInsetsFoundation.all16),
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
      style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.mutedText),
    );
  }
}
