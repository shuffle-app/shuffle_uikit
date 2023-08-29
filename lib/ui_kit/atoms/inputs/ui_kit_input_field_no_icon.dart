import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFieldNoIcon extends StatefulWidget
    implements BaseUiKitInputField {
  const UiKitInputFieldNoIcon({
    Key? key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.minLines,
    this.enabled = true,
    this.borderRadius
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

  final ValueChanged<String>? onChanged;

  final Color? fillColor;
  final int? minLines;
  final BorderRadius? borderRadius;

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
        borderRadius: widget.borderRadius!, borderSide: const BorderSide(
        color: Colors.white,
        width: 2,
      ),),
      enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius!, borderSide: BorderSide.none),)
        : uiKitTheme?.noIconInputTheme;
    final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(
        color: ColorsFoundation.error);
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(
      color: _key.currentState?.hasError ?? false
          ? ColorsFoundation.error
          : Colors.white,
    );
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium
        .copyWith(
      color: widget.enabled ? Colors.white.withOpacity(0.48) : ColorsFoundation
          .darkNeutral900.withOpacity(0.16),
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
        minLines: widget.minLines,
        maxLines: (widget.minLines ?? 0) + 1,
        controller: widget.enabled ? widget.controller : null,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
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
