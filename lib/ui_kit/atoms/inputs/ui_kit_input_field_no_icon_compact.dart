import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFieldNoIconCompact extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final bool enabled;
  final bool autofocus;
  final String? Function(String?)? validator;
  final String? label;
  final VoidCallback? onTap;
  final Color? customLabelColor;
  final Color? customHintColor;
  final Color? customInputTextColor;
  final InputBorder? customFocusedBorder;
  final InputBorder? customEnabledBorder;

  const UiKitInputFieldNoIconCompact({
    Key? key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.validator,
    this.enabled = true,
    this.autofocus = false,
    this.onTap,
    this.customLabelColor,
    this.customHintColor,
    this.customInputTextColor,
    this.customFocusedBorder,
    this.customEnabledBorder,
    this.label,
  }) : super(key: key);

  @override
  State<UiKitInputFieldNoIconCompact> createState() => _UiKitInputFieldNoIconCompactState();
}

class _UiKitInputFieldNoIconCompactState extends State<UiKitInputFieldNoIconCompact> {
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
    final inputTheme = uiKitTheme?.noIconInputTheme;
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: TextFormField(
              key: _key,
              onTap: widget.onTap,
              autofocus: widget.autofocus,
              enabled: widget.enabled,
              style: inputTextStyle,
              controller: widget.enabled ? widget.controller : null,
              validator: widget.validator,
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: labelStyle,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: EdgeInsetsFoundation.horizontal16,
                  vertical: EdgeInsetsFoundation.vertical12,
                ),
                hintText: '${widget.hintText}',
                hintStyle: hintStyle,
                errorStyle: errorStyle?.copyWith(fontSize: 0),
                enabledBorder: widget.customEnabledBorder,
                focusedBorder: widget.customFocusedBorder,
              ),
            ),
          ),
          if (_key.currentState?.hasError ?? false)
            Text(
              widget.validator?.call(widget.controller.text) ?? '',
              style: errorStyle,
            ),
        ],
      ),
    );
  }
}
