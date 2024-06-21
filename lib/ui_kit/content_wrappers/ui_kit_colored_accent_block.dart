import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitColoredAccentBlock extends StatelessWidget {
  final Color? color;
  final Widget title;
  final Widget? content;
  final double? titlePadding;
  final double contentHeight;
  final Widget? action;

  const UiKitColoredAccentBlock({
    Key? key,
    required this.contentHeight,
    required this.title,
    this.content,
    this.color,
    this.action,
    this.titlePadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return UiKitCardWrapper(
      borderRadius: BorderRadius.zero,
      width: 1.sw,
      color: color ?? colorScheme?.surface1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: title.paddingAll(titlePadding ?? EdgeInsetsFoundation.all16)),
              if (action != null) SpacingFoundation.horizontalSpace16,
              if (action != null) action!,
            ],
          ),
          if (content != null)
            SizedBox(
              height: contentHeight,
              width: 1.sw,
              child: content,
            ),
          if (content != null) SpacingFoundation.verticalSpace16,
        ],
      ),
    );
  }
}
