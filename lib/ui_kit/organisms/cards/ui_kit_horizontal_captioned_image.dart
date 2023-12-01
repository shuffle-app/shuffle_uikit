import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHorizontalCaptionedImage extends StatelessWidget {
  final String title;
  final String imageLink;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;

  const UiKitHorizontalCaptionedImage({
    Key? key,
    required this.title,
    required this.imageLink,
    required this.borderRadius,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidth = 0.28125.sw;
    final imageHeight = imageWidth * 0.577;
    final maxWidth = 0.678125.sw;
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: imageHeight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusFoundation.all8,
              border: Border.all(
                color: context.uiKitTheme?.colorScheme.darkNeutral500.withOpacity(0.32) ?? Colors.transparent,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusFoundation.all8,
              child: ImageWidget(
                link: imageLink,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SpacingFoundation.horizontalSpace8,
          Expanded(
            child: Text(
              title,
              style: textTheme?.caption3Medium,
            ),
          ),
        ],
      ),
    );
  }
}
