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
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (visibleMediaCount < mediaList.length)
          ...mediaList.sublist(0, visibleMediaCount).map(
                (photo) => _itemBuilder(photo),
              ),
        if (visibleMediaCount >= mediaList.length)
          ...mediaList.map(
            (photo) => _itemBuilder(photo),
          ),
      ],
    );
  }

  Widget _itemBuilder(UiKitMediaPhoto photo) {
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
            imagePath: mediaList.last.link,
            height: height,
            width: height,
          ),
      ],
    );
  }
}
