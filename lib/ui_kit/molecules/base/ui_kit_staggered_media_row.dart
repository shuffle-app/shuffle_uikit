import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitStaggeredMediaRow extends UiKitContentUpdateWidget {
  final List<UiKitMediaPhoto> mediaList;
  final int visibleMediaCount;

  const UiKitStaggeredMediaRow({
    super.key,
    required this.mediaList,
    required this.visibleMediaCount,
  });

  @override
  double get height => kIsWeb ? 50 : 0.125.sw;

  @override
  Widget build(BuildContext context) {
    final microseconds = DateTime.now().microsecondsSinceEpoch;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (visibleMediaCount < mediaList.length)
          ...mediaList.sublist(0, visibleMediaCount).map(
                (photo) => _itemBuilder(photo, context, microseconds: microseconds),
              ),
        if (visibleMediaCount >= mediaList.length)
          ...mediaList.map(
            (photo) => _itemBuilder(photo, context, microseconds: microseconds),
          ),
      ],
    );
  }

  Widget _itemBuilder(UiKitMediaPhoto photo, BuildContext context, {int? microseconds}) {
    final indexOfPhoto = mediaList.indexOf(photo);
    final String heroTag = '${photo.link}--${microseconds}';

    final isHorizontal = indexOfPhoto % 2 == 0;
    final isLast = indexOfPhoto == visibleMediaCount - 1;
    double width = isHorizontal ? height * 1.325 : height;

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.push(
              PhotoDialog(
                images: mediaList.map((e) => e.link).toList(),
                initialIndex: indexOfPhoto,
                tag: heroTag,
              ),
              nativeTransition: false,
              transitionDuration: const Duration(milliseconds: 500),
                useRootNavigator: true
            );
          },
          child: Hero(
            tag: heroTag,
            transitionOnUserGestures: true,
            child: ImageWidget(
              height: height,
              width: width,
              link: photo.link,
              fit: BoxFit.cover,
            ),
          ).paddingOnly(right: EdgeInsetsFoundation.horizontal6),
        ),
        if (isLast)
          UiKitContentUpdatePlaceholder(
            title: S.current.PlusXPhotos(mediaList.length - visibleMediaCount).toLowerCase(),
            imagePath: mediaList.last.link,
            height: height,
            width: height,
          ),
      ],
    );
  }
}
