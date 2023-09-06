import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Color? textColor;
  final bool showSpacing;
  final bool uniqueTag;
  final double? tagSize;

  /// [customSpace] needs to be specified using [SpacingFoundation]
  final Widget? customSpace;

  const UiKitTagWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.textColor,
    this.tagSize,
    this.customSpace,
    this.uniqueTag = false,
    this.showSpacing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
      color: textColor ?? ColorsFoundation.darkNeutral500,
    );

    final iconColor = uniqueTag ? Colors.white : textColor ?? ColorsFoundation.darkNeutral500;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showSpacing) customSpace ?? SpacingFoundation.horizontalSpace12,
        GradientableWidget(
          active: uniqueTag,
          gradient: GradientFoundation.badgeIcon,
          child: ImageWidget(
            link: icon,
            errorWidget: ImageWidget(svgAsset: GraphicsFoundation.instance.svg.exclamation, color: iconColor),
            height: tagSize ?? SpacingFoundation.horizontalSpacing16,
            width: tagSize ?? SpacingFoundation.horizontalSpacing16,
            color: iconColor,
            fit: tagSize != null ? BoxFit.cover : BoxFit.fitHeight,
          ),
        ),
        SpacingFoundation.horizontalSpace2,
        Text(
          title,
          style: textStyle,
        ),
      ],
    );
  }
}
