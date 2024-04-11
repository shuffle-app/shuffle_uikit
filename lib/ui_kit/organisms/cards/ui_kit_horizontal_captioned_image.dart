import 'package:flutter/cupertino.dart';
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
    final theme = context.uiKitTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: imageHeight,
      ),
      child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: imageHeight,
                  width: imageWidth,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusFoundation.all8,
                      border: Border.all(
                        color: ColorsFoundation.neutral32,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadiusFoundation.all8,
                      child: ImageWidget(
                        link: imageLink,
                        height: 52, // imageHeight,
                        width: 90, //imageWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              SpacingFoundation.horizontalSpace8,
              Expanded(
                child: Text(
                  title,
                  style: theme?.boldTextTheme.caption3Medium.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          )),
    );
  }
}
