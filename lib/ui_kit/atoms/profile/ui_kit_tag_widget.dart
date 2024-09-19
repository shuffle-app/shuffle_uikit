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

    final isDarkMode = context.uiKitTheme?.colorScheme.surface == UiKitColorScheme.dark().surface;

    final iconColor = iconCustomColor ?? (uniqueTag ? Colors.white : textColor ?? ColorsFoundation.darkNeutral500);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showSpacing) customSpace ?? SpacingFoundation.horizontalSpace12,
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          if(showShadow)
          DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadiusFoundation.max, boxShadow: [
                BoxShadow(
                  color: (isDarkMode ? UiKitColors.yellowDarkShadow : UiKitColors.yellowBrightShadow).withOpacity(0.6),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                  blurStyle: BlurStyle.normal,
                )
              ]),
              child: SizedBox(
                height: SpacingFoundation.horizontalSpacing12,
                width: SpacingFoundation.horizontalSpacing12,
              )),
          GradientableWidget(
            active: uniqueTag,
            gradient: GradientFoundation.badgeIcon,
            child: ImageWidget(
              link: icon is String ? icon as String : null,
              iconData: icon is IconData ? icon as IconData : null,
              cardColor: Colors.transparent,
              errorWidget: ImageWidget(
                  iconData: ShuffleUiKitIcons.logo,
                  height: tagSize ?? SpacingFoundation.horizontalSpacing16,
                  width: tagSize ?? SpacingFoundation.horizontalSpacing16,
                  color: iconColor,
                  fit: tagSize != null ? BoxFit.cover : BoxFit.fitHeight),
              height: tagSize ?? SpacingFoundation.horizontalSpacing16,
              width: tagSize ?? SpacingFoundation.horizontalSpacing16,
              color: iconColor,
              fit: tagSize != null ? BoxFit.cover : BoxFit.fitHeight,
            ),
          )
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
