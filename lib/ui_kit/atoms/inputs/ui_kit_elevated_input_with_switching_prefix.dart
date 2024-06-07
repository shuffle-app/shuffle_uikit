import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitElevatedInputWithSwitchingPrefix extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Color? fillColor;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final VoidCallback? onInputCleaned;
  final bool readOnly;

  const UiKitElevatedInputWithSwitchingPrefix({
    super.key,
    required this.controller,
    this.readOnly = false,
    this.hintText,
    this.prefix,
    this.suffixIcon,
    this.fillColor,
    this.focusNode,
    this.onTap,
    this.onInputCleaned,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Material(
      elevation: 2.5,
      borderRadius: BorderRadiusFoundation.max,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (prefix != null) prefix!,
          SpacingFoundation.horizontalSpace8,
          Expanded(
            child: TextField(
              onTap: onTap,
              textAlignVertical: TextAlignVertical.center,
              focusNode: focusNode,
              cursorColor: Colors.black,
              controller: controller,
              readOnly: readOnly,
              style: textTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                filled: fillColor != null,
                fillColor: fillColor,
                hintText: hintText,
                hintStyle: textTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                suffixIcon: suffixIcon ??
                    GestureDetector(
                      onTap: () {
                        controller.clear();
                        if (focusNode?.hasFocus ?? true) onInputCleaned?.call();
                      },
                      child: const ImageWidget(
                        iconData: ShuffleUiKitIcons.x,
                        color: ColorsFoundation.darkNeutral900,
                      ),
                    ),
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
    );
  }
}
