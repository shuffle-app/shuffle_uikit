import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class WideVerticalMessageCard extends StatelessWidget {
  final String message;
  final IconData? iconData;
  final VoidCallback? onPressed;
  final String? iconLink;

  const WideVerticalMessageCard({
    super.key,
    required this.message,
    this.iconData,
    this.iconLink,
    this.onPressed,
  });

  double get width => 0.375.sw;

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      color: colorScheme?.surface2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpacingFoundation.verticalSpace12,
              if (iconData != null || iconLink != null)
                ImageWidget(
                  iconData: iconData,
                  link: iconLink,
                  height: 0.1875.sw,
                  width: 0.1875.sw,
                  fit: BoxFit.cover,
                ),
              if (iconData != null || iconLink != null) SpacingFoundation.verticalSpace2,
              Text(

                      /// end line symbols added to make sure that the text is more than 3 lines
                      /// so that the card height is always fixed
                      '$message\n\n\n'.toUpperCase(),
                      style: messageStyle,
                      textAlign: TextAlign.center,
                      // wrapWords: true,
                      // minFontSize: 8,
                      maxLines: 3,
                      softWrap: true)
                  .paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal12),
              SpacingFoundation.verticalSpace12,
            ],
          ),
        ),
      ),
    );
  }
}
