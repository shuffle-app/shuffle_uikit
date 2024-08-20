import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitStaggeredMediaRow extends UiKitContentUpdateWidget {
  final List<UiKitMediaPhoto> mediaList;
  final int visibleMediaCount;

  const UiKitStaggeredMediaRow({
    Key? key,
    required this.mediaList,
    required this.visibleMediaCount,
  }) : super(key: key);

  @override
  double get height => 0.125.sw;

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (visibleMediaCount < mediaList.length)
          ...mediaList.sublist(0, visibleMediaCount).map(
            (photo) {
              final isHorizontal = mediaList.indexOf(photo) % 2 == 0;
              final isLast = mediaList.indexOf(photo) == visibleMediaCount - 1;
              double width = isHorizontal ? height * 1.325 : height;

              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusFoundation.all8,
                    child: ImageWidget(
                      height: height,
                      width: width,
                      link: photo.link,
                      fit: BoxFit.cover,
                    ),
                  ).paddingOnly(right: EdgeInsetsFoundation.horizontal6),
                  if (isLast)
                    UiKitContentUpdatePlaceholder(
                      title: S.current.PlusXPhotos(mediaList.length - visibleMediaCount).toLowerCase(),
                      gradient: GradientFoundation.cyanGradient,
                      height: height,
                      width: height,
                    ),
                ],
              );
            },
          ),
      ],
    );
  }
}
