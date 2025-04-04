import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class VerticalMessageCard extends StatelessWidget {
  final String message;
  final IconData? iconData;
  final VoidCallback? onPressed;
  final String? iconLink;

  const VerticalMessageCard({
    super.key,
    required this.message,
    this.iconData,
    this.iconLink,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = kIsWeb ? 100.0 : 0.33.sw;
    final messageStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      color: colorScheme?.surface3,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.all24,
        onTap: onPressed,
        child: Ink(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all24,
            color: colorScheme?.surface3,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconData != null || iconLink != null)
                ImageWidget(
                  iconData: iconData,
                  link: iconLink,
                  height: kIsWeb ? 80 : 0.1875.sw,
                  width: kIsWeb ? 80 : 0.1875.sw,
                  fit: BoxFit.cover,
                ),
              if (iconData != null || iconLink != null) SpacingFoundation.verticalSpace2,
              AutoSizeText(
                /// end line symbols added to make sure that the text is more than 4 lines
                /// so that the card height is always fixed
                '${message.toUpperCase()}\n\n\n\n',
                style: messageStyle,
                softWrap: true,
                wrapWords: true,
                textAlign: TextAlign.center,
                maxLines: 4,
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all12),
        ),
      ),
    );
  }
}
