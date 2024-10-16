import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagWidget extends StatelessWidget {
  final String title;
  final dynamic icon;
  final Color? textColor;
  final Color? iconCustomColor;
  final bool showSpacing;
  final bool uniqueTag;
  final double? tagSize;
  final bool showShadow;

  /// [customSpace] needs to be specified using [SpacingFoundation]
  final Widget? customSpace;

  const UiKitTagWidget({
    super.key,
    required this.title,
    required this.icon,
    this.textColor,
    this.iconCustomColor,
    this.tagSize,
    this.customSpace,
    this.uniqueTag = false,
    this.showSpacing = false,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
      color: textColor ?? ColorsFoundation.darkNeutral500,
    );

    final iconColor = iconCustomColor ?? (uniqueTag ? Colors.white : textColor ?? ColorsFoundation.darkNeutral500);

    final image = ImageWidget(
      link: icon is String ? icon as String : null,
      iconData: icon is IconData ? icon as IconData : null,
      cardColor: Colors.transparent,
      errorWidget: ImageWidget(
          iconData: ShuffleUiKitIcons.shuffleDefault,
          height: tagSize ?? SpacingFoundation.horizontalSpacing16,
          width: tagSize ?? SpacingFoundation.horizontalSpacing16,
          color: iconColor,
          fit: tagSize != null ? BoxFit.cover : BoxFit.fitHeight),
      height: tagSize ?? SpacingFoundation.horizontalSpacing16,
      width: tagSize ?? SpacingFoundation.horizontalSpacing16,
      color: iconColor,
      fit: tagSize != null ? BoxFit.cover : BoxFit.fitHeight,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showSpacing) customSpace ?? SpacingFoundation.horizontalSpace12,
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          if (showShadow) RepaintBoundary(child: GlowShadowWidget(child: image)),
          GradientableWidget(active: uniqueTag, gradient: GradientFoundation.badgeIcon, child: image)
        ]),
        SpacingFoundation.horizontalSpace2,
        SizedBox(
          height: SpacingFoundation.horizontalSpacing20,
          child: Center(
            child: Text(
              title,
              style: textStyle,
            ),
          ),
        ),
      ],
    );
  }
}
