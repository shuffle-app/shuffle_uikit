import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFieldRightIcon extends StatefulWidget implements BaseUiKitInputField {
  const UiKitInputFieldRightIcon({
    Key? key,
    required this.controller,
    this.errorText,
    this.fillColor,
    this.hintText,
    this.validator,
    this.enabled = true,
    this.icon,
    this.onPressed,
    this.onTap,
    this.focusNode,
    this.autofocus = false,
    this.expands = false,
    this.onFieldSubmitted,
    this.borderRadius,
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

  final Widget? icon;
  final BorderRadius? borderRadius;
  final bool autofocus;
  final bool expands;
  final FocusNode? focusNode;

  final VoidCallback? onPressed;
  final VoidCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? fillColor;

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
    final inputTheme = widget.borderRadius != null
        ? uiKitTheme?.iconInputTheme.copyWith(
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius!,
              borderSide: BorderSide(color: uiKitTheme.colorScheme.inversePrimary, width: 2),
            ),
            enabledBorder: OutlineInputBorder(borderRadius: widget.borderRadius!, borderSide: BorderSide.none),
          )
        : uiKitTheme?.iconInputTheme;
    final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.error);
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(color: uiKitTheme.colorScheme.inversePrimary);
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
        expands: widget.expands,
        maxLines: widget.expands ? null : 1,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
        enabled: widget.enabled,
        controller: widget.enabled ? widget.controller : null,
        validator: widget.validator,
        obscureText: widget.obscureText,
        style: inputTextStyle,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          contentPadding: EdgeInsets.all(EdgeInsetsFoundation.all16),
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorStyle: errorStyle,
          errorMaxLines: 3,
          hintStyle: hintStyle,
          suffixIconColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.error)) {
              return ColorsFoundation.error;
            }
            return context.uiKitTheme?.colorScheme.inversePrimary ?? Colors.white;
          }),
          suffixIcon: IconButton(
            icon: widget.icon ??  Icon(Icons.close,color: uiKitTheme?.colorScheme.inversePrimary,),
            onPressed: widget.onPressed ??
                () {
                  widget.controller.clear();
                },
            visualDensity: VisualDensity.compact,
            splashRadius: 5,
          ),
        ),
      ),
    );
  }
}
