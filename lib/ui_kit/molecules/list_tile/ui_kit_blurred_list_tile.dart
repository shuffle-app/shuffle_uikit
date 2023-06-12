import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBlurredListTile extends StatelessWidget {
  final String? title;
  final Widget? titleTrailing;
  final String? subtitle;
  final String? photoLink;

  const UiKitBlurredListTile({
    Key? key,
    this.title,
    this.titleTrailing,
    this.subtitle,
    this.photoLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final titleTextStyle = textTheme?.caption1Bold;
    final subtitleTextStyle = textTheme?.caption1Medium;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (photoLink != null)
              CircularAvatar(
                avatarUrl: photoLink!,
                height: 56,
              ),
            SpacingFoundation.horizontalSpace12,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '$title',
                        style: titleTextStyle,
                      ),
                      if (titleTrailing != null) ...[
                        SpacingFoundation.horizontalSpace8,
                        titleTrailing!,
                      ],
                    ],
                  ),
                  Text(
                    '$subtitle',
                    style: subtitleTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all12),
      ),
    );
  }
}
