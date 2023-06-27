import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaImageWidget extends BaseUiKitMediaWidget {
  final BaseUiKitMedia media;
  final double? width;

  const UiKitMediaImageWidget({Key? key, required this.media, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all24,
      child: ImageWidget(
        lowerQuality: true,
        link: media.link,
        width: width ?? 0.83.sw,
        fit: BoxFit.cover,
        errorWidget: const UiKitBigPhotoErrorWidget(),
      ),
    );
  }
}
