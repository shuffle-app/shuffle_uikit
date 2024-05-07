import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBlurredListTile extends StatelessWidget {
  final String? title;
  final Widget? titleTrailing;
  final String? subtitle;
  final String? photoLink;
  final UserTileType? type;

  const UiKitBlurredListTile({
    Key? key,
    this.title,
    this.titleTrailing,
    this.subtitle,
    this.photoLink,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final titleTextStyle = textTheme?.caption1Bold;
    final subtitleTextStyle = textTheme?.caption1Medium;
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

    late final Decoration decoration;

    final borderWidth = 2.5.w;
    if (type == UserTileType.pro) {
      decoration = BoxDecoration(
        color: ColorsFoundation.darkNeutral400,
        borderRadius: BorderRadiusFoundation.max,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 3,
            offset: Offset.zero,
          ),
        ],
        border: GradientBoxBorder(
          gradient: GradientFoundation.proUserAvatarBorder,
          width: borderWidth,
        ),
      );
    } else {
      decoration = BoxDecoration(
        borderRadius: BorderRadiusFoundation.max,
        boxShadow: [
          BoxShadow(
            color: isLightTheme ? ColorsFoundation.darkNeutral900.withOpacity(0.4) : Colors.white.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 3,
            offset: Offset.zero,
          )
        ],
      );
    }

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
            if (photoLink != null)
              DecoratedBox(
                  decoration: decoration,
                  child: CircularAvatar(
                    avatarUrl: photoLink!,
                    height: 56,
                  )),
            SpacingFoundation.horizontalSpace12,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
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
