import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Color? textColor;
  final bool showSpacing;
  final bool uniqueTag;

  /// [customSpace] needs to be specified using [SpacingFoundation]
  final Widget? customSpace;

  const UiKitTagWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.textColor,
    this.customSpace,
    this.uniqueTag = false,
    this.showSpacing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
      color: textColor ?? ColorsFoundation.darkNeutral900,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showSpacing) customSpace ?? SpacingFoundation.horizontalSpace12,
        ImageWidget(
          link: icon,
          height: SpacingFoundation.horizontalSpacing12,
          color: uniqueTag ? Colors.white : ColorsFoundation.darkNeutral900,
          fit: BoxFit.fitHeight,
          // package: 'shuffle_uikit',
        ),
        SpacingFoundation.horizontalSpace4,
        Text(
          title,
          style: textStyle,
        ),
      ],
    );
  }
}
