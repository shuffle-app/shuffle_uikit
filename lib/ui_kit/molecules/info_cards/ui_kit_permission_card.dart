import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPermissionCard extends StatelessWidget {
  final String title;
  final String description;
  final AssetGenImage image;
  final VoidCallback? onPress;
  final bool isEnabled;
  final String? onImageText;

  const UiKitPermissionCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.onPress,
    this.onImageText,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    final labelStyle = theme?.regularTextTheme.subHeadline;
    final textStyle = theme?.regularTextTheme.caption1;

    return GestureDetector(
      onTap: onPress,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UiKitCheckbox(
                  isActive: isEnabled,
                ),
                SpacingFoundation.horizontalSpace12,
                Expanded(
                  child: Text(
                    title,
                    style: labelStyle,
                  ),
                ),
              ],
            ),
            SpacingFoundation.verticalSpace16,
            Text(
              description,
              style: textStyle,
            ),
            SpacingFoundation.verticalSpace24,
            ImageWidget(
              rasterAsset: image,
            ),
            SpacingFoundation.verticalSpace24,
          ],
        ),
        if (onImageText != null)
          Transform.translate(
              offset: const Offset(4, -95),
              child: Text(
                onImageText!,
                style: theme?.boldTextTheme.title2.copyWith(color: Colors.white),
              ))
      ]),
    );
  }
}
