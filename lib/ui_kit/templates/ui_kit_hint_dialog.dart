import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHintDialog extends StatelessWidget {
  final String title;
  final List<UiKitIconHintCard> hintTiles;
  final String subtitle;
  final String dismissText;
  final VoidCallback onDismiss;

  const UiKitHintDialog({
    Key? key,
    required this.title,
    required this.hintTiles,
    required this.subtitle,
    required this.dismissText,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.title2;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: textStyle,
        ),
        SpacingFoundation.verticalSpace8,
        Wrap(
          spacing: 16.w,
          runSpacing: 8.h,
          children: hintTiles,
        ),
        SpacingFoundation.verticalSpace8,
        Text(
          subtitle,
          style: textStyle,
        ),
        SpacingFoundation.verticalSpace8,
        context.button(
          text: dismissText,
          onPressed: onDismiss,
        ),
      ],
    );
  }
}
