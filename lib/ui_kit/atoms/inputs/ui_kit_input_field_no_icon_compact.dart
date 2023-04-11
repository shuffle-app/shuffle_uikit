import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';

class UiKitInputFieldNoIconCompact extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final bool enabled;
  final String? Function(String?)? validator;
  const UiKitInputFieldNoIconCompact({
    Key? key,
    required this.controller,
    this.errorText,
    this.hintText,
    this.validator,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<UiKitInputFieldNoIconCompact> createState() => _UiKitInputFieldNoIconCompactState();
}

class _UiKitInputFieldNoIconCompactState extends State<UiKitInputFieldNoIconCompact> {
  final ValueKey _key = const ValueKey(UiKitInputFieldNoIconCompact);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final uiKitTheme = Theme.of(context).extension<UiKitThemeData>();
        final inputTheme = uiKitTheme?.noIconInputTheme;
        final errorStyle = uiKitTheme?.regularTextTheme.caption2.copyWith(color: ColorsFoundation.error);
        final inputTextStyle = uiKitTheme?.boldTextTheme.caption1Medium.copyWith(color: Colors.white);
        final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
          color: widget.enabled ? Colors.white.withOpacity(0.48) : ColorsFoundation.solidGreyText.withOpacity(0.16),
        );
        return Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: inputTheme,
            disabledColor: ColorsFoundation.darkNeutral.withOpacity(0.16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                child: TextFormField(
                  key: _key,
                  enabled: widget.enabled,
                  style: inputTextStyle,
                  controller: widget.enabled ? widget.controller : null,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsFoundation.horizontal16,
                    hintText: '${widget.hintText}',
                    hintStyle: hintStyle,
                    errorStyle: errorStyle?.copyWith(fontSize: 0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
