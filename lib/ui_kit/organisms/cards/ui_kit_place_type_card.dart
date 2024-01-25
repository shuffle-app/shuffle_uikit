import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

enum UiKitSocialSearchContentType {
  places,
  services,
}

class UiKitSocialSearchContentTypeCard extends StatelessWidget {
  final String title;
  final Color? iconRingColor;
  final BaseUiKitButtonIconData iconData;
  final VoidCallback? onTap;
  final double? customCardWidth;
  final UiKitSocialSearchContentType type;
  final Color color;

  const UiKitSocialSearchContentTypeCard._({
    Key? key,
    required this.title,
    required this.color,
    this.iconRingColor,
    required this.iconData,
    this.onTap,
    this.customCardWidth,
    required this.type,
  }) : super(key: key);

  factory UiKitSocialSearchContentTypeCard.places({
    required BaseUiKitButtonIconData iconData,
    required String title,
    VoidCallback? onTap,
    double? customCardWidth,
    Color? iconRingColor,
    Color? backgroundColor,
  }) =>
      UiKitSocialSearchContentTypeCard._(
        title: title,
        iconData: iconData,
        onTap: onTap,
        customCardWidth: customCardWidth,
        iconRingColor: iconRingColor,
        type: UiKitSocialSearchContentType.places,
        color: backgroundColor ?? ColorsFoundation.darkNeutral100,
      );

  factory UiKitSocialSearchContentTypeCard.services({
    required BaseUiKitButtonIconData iconData,
    required String title,
    VoidCallback? onTap,
    double? customCardWidth,
    Color? iconRingColor,
    Color? backgroundColor,
  }) =>
      UiKitSocialSearchContentTypeCard._(
        title: title,
        iconData: iconData,
        onTap: onTap,
        customCardWidth: customCardWidth,
        iconRingColor: iconRingColor,
        type: UiKitSocialSearchContentType.services,
        color: backgroundColor ?? Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    final cardWidth = customCardWidth ?? 0.25.sw;
    final cardHeight = customCardWidth != null ? cardWidth * 0.56 : cardWidth;
    final iconHeight = type == UiKitSocialSearchContentType.services ? 0.85 * cardHeight : 0.75 * cardHeight;
    final iconWidth = type == UiKitSocialSearchContentType.services ? 0.75 * cardWidth : iconHeight;

    return Material(
      color: color,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all16,
        side: BorderSide(
          color: ColorsFoundation.lightGrey.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: cardWidth,
          height: cardHeight,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            fit: StackFit.expand,
            children: [
              Positioned(
                top: type == UiKitSocialSearchContentType.services
                    ? customCardWidth != null
                        ? -SpacingFoundation.horizontalSpacing8
                        : -SpacingFoundation.verticalSpacing4
                    : -SpacingFoundation.verticalSpacing6,
                right: type == UiKitSocialSearchContentType.services
                    ? customCardWidth != null
                        ? -SpacingFoundation.horizontalSpacing8
                        : -SpacingFoundation.horizontalSpacing4
                    : -SpacingFoundation.horizontalSpacing6,
                child: ImageWidget(
                  link: iconData.iconPath,
                  iconData: iconData.iconData,
                  fit: BoxFit.cover,
                  width: iconWidth,
                  height: iconHeight,
                ),
              ),
              if (iconRingColor != null)
                Positioned(
                  width: iconWidth + 12,
                  height: iconHeight + 12,
                  top: -cardWidth * 0.2,
                  left: cardWidth * 0.275,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: iconRingColor!,
                        width: 3,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                width: cardWidth,
                left: customCardWidth == null ? 0 : EdgeInsetsFoundation.horizontal8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: context.uiKitTheme?.regularTextTheme.caption4Regular.copyWith(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                      textAlign: customCardWidth == null ? TextAlign.center : TextAlign.start,
                    ).paddingAll(EdgeInsetsFoundation.all4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
