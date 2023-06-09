import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaVideoWidget extends BaseUiKitMediaWidget {
  final BaseUiKitMedia media;
  final double? width;

  const UiKitMediaVideoWidget({
    Key? key,
    required this.media,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusFoundation.all24,
          child: ImageWidget(
            link: media.link,
            width: width ??  0.75.sw,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12.h,
          left: 12.w,
          child: BlurredPlaceVideoPlayButton(
            onPressed: () {
              log('Play', name: 'UiKitMediaWidget');
            },
          ),
        ),
      ],
    );
  }
}
