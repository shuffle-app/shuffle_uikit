import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSocialSearchCard extends StatelessWidget {
  final BaseUiKitButtonIconData? imageData;
  final BorderRadius? leadingImageBorderRadius;
  final VoidCallback? onTap;
  final String title;
  final String subtitle;
  final String distance;
  final double progress;

  const UiKitSocialSearchCard({
    Key? key,
    this.imageData,
    this.leadingImageBorderRadius,
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.distance,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = 0.125.sw;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return GestureDetector(
      onTap: onTap,
      child: UiKitCardWrapper(
        borderRadius: BorderRadiusFoundation.all24,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: leadingImageBorderRadius ?? BorderRadiusFoundation.all12,
              child: ImageWidget(
                link: imageData?.iconPath,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
              ),
            ).paddingOnly(bottom: EdgeInsetsFoundation.all6),
            SpacingFoundation.horizontalSpace12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: boldTextTheme?.caption1Bold.copyWith(overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                      ),
                      SpacingFoundation.horizontalSpace2,
                      Text(
                        distance,
                        style: regularTextTheme?.caption4Regular.copyWith(
                          color: ColorsFoundation.mutedText,
                        ),
                      ),
                    ],
                  ),
                  SpacingFoundation.verticalSpace2,
                  Text(
                    subtitle,
                    style: boldTextTheme?.caption1Medium.copyWith(
                      color: ColorsFoundation.mutedText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SpacingFoundation.verticalSpace2,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: UiKitProgressIndicator(
                      progress: progress,
                      width: 0.1125.sw,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingOnly(
          top: EdgeInsetsFoundation.all12,
          left: EdgeInsetsFoundation.all12,
          right: EdgeInsetsFoundation.all12,
          bottom: EdgeInsetsFoundation.all6,
        ),
      ),
    );
  }
}
