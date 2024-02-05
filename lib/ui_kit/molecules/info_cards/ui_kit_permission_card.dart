import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPermissionCard extends StatelessWidget {
  final String title;
  final String description;
  final AssetGenImage image;
  final VoidCallback? onPress;
  final bool isEnabled;

  const UiKitPermissionCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.onPress,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    final labelStyle = theme?.regularTextTheme.subHeadline;
    final textStyle = theme?.regularTextTheme.caption1;

    return GestureDetector(
      onTap: onPress,
      child: Column(
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
          //         Transform.scale(
          //             scaleX: 1.2,
          // child:
          ImageWidget(
            rasterAsset: image,
            // )
          ),
          SpacingFoundation.verticalSpace24,
        ],
      ),
    );
  }
}
