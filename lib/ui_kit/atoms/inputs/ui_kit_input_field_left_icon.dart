import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFieldLeftIcon extends StatefulWidget implements BaseUiKitInputField {
  const UiKitInputFieldLeftIcon({
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
  State<UiKitInputFieldLeftIcon> createState() => _UiKitInputFieldLeftIconState();


}

class _UiKitInputFieldLeftIconState extends State<UiKitInputFieldLeftIcon> {
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
    final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(
      color: (_key.currentState?.hasError ?? false) ? ColorsFoundation.error : Colors.white,
    );
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
        style: inputTextStyle,
        enabled: widget.enabled,
        controller: widget.enabled ? widget.controller : null,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorMaxLines: 1,
          errorStyle: errorStyle,
          hintStyle: hintStyle,
          prefixIconColor: inputPropertiesColor,
          prefixIcon: IconButton(
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
