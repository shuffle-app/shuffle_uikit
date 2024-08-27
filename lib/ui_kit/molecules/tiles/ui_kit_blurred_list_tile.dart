import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBlurredListTile extends StatelessWidget {
  final String? title;
  final Widget? titleTrailing;
  final String? subtitle;
  final String? photoLink;
  final UserTileType? type;

  const UiKitBlurredListTile({
    super.key,
    this.title,
    this.titleTrailing,
    this.subtitle,
    this.photoLink,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final titleTextStyle = textTheme?.caption1Bold;
    final subtitleTextStyle = textTheme?.caption1Medium;
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

    final borderWidth = 2.5.w;

    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all24,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 21,
          sigmaY: 21,
          tileMode: TileMode.repeated,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (photoLink != null && type == UserTileType.pro)
              UiKitProUserAccountAvatarWrapper.enabled(
                borderWidth: borderWidth,
                child: CircularAvatar(
                  avatarUrl: photoLink!,
                  height: 56,
                ),
              ),
            if (photoLink != null && type != UserTileType.pro)
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.max,
                  boxShadow: [
                    BoxShadow(
                      color: isLightTheme
                          ? ColorsFoundation.darkNeutral900.withOpacity(0.4)
                          : Colors.white.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: Offset.zero,
                    )
                  ],
                ),
                child: CircularAvatar(
                  avatarUrl: photoLink!,
                  height: 56,
                ),
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
                      Flexible(
                        child: Text(
                          '$title',
                          maxLines: (subtitle ?? '').isNotEmpty ? 1 : 2,
                          style: titleTextStyle?.copyWith(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (titleTrailing != null) ...[
                        if(title?.isNotEmpty ?? false)
                        SpacingFoundation.horizontalSpace8,
                        titleTrailing!,
                      ],
                    ],
                  ),
                  if ((subtitle ?? '').isNotEmpty)
                    Text(
                      subtitle ?? '',
                      maxLines: 1,
                      style: subtitleTextStyle?.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                      ),
                    )
                ],
              ),
            )
          ],
        ).paddingAll(EdgeInsetsFoundation.all12),
      ),
    );
  }
}
