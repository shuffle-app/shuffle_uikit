import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBlurredListTile extends StatelessWidget {
  final String? title;
  final Widget? titleTrailing;
  final Future<String>? subtitle;
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
        filter: ImageFilter.blur(
          sigmaX: 35,
          sigmaY: 35,
          tileMode: TileMode.repeated,
        ),
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
              child: FutureBuilder(
                future: subtitle,
                builder: (context, snapshot) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            '$title',
                            maxLines: (snapshot.data ?? '').isNotEmpty ? 1 : 2,
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
                    if ((snapshot.data ?? '').isNotEmpty)
                      Text(
                        snapshot.data ?? '',
                        maxLines: 1,
                        style: subtitleTextStyle?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all12),
      ),
    );
  }
}
