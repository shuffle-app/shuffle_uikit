import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class UiKitInputFieldRightIcon extends StatefulWidget implements BaseUiKitInputField {
  const UiKitInputFieldRightIcon({
    Key? key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.validator,
    this.enabled = true,
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
  State<UiKitInputFieldRightIcon> createState() => _UiKitInputFieldRightIconState();
}

class _UiKitInputFieldRightIconState extends State<UiKitInputFieldRightIcon> {
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
    final inputTheme = uiKitTheme?.iconInputTheme;
    final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.error);
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(color: Colors.white);
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: widget.enabled ? Colors.white.withOpacity(0.48) : ColorsFoundation.darkNeutral900.withOpacity(0.16),
    );
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: inputTheme,
        disabledColor: ColorsFoundation.darkNeutral500.withOpacity(0.16),
      ),
      child: TextFormField(
        key: _key,
        enabled: widget.enabled,
        controller: widget.enabled ? widget.controller : null,
        validator: widget.validator,
        style: inputTextStyle?.copyWith(
          color: _key.currentState?.hasError ?? false ? ColorsFoundation.error : Colors.white,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorStyle: errorStyle,
          errorMaxLines: 1,
          hintStyle: hintStyle,
          suffixIconColor: inputPropertiesColor,
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
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
