import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
      color: _key.currentState?.hasError ?? false ? ColorsFoundation.error : Colors.white,
    );
    final hintStyle = uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: widget.enabled ? Colors.white.withOpacity(0.48) : ColorsFoundation.darkNeutral900.withOpacity(0.16),
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
              enabled: widget.enabled,
              style: inputTextStyle,
              controller: widget.enabled ? widget.controller : null,
              validator: widget.validator,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.w),
                hintText: '${widget.hintText}',
                hintStyle: hintStyle,
                errorStyle: errorStyle?.copyWith(fontSize: 0),
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
