import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSwiperAdCard extends BaseUiKitSwiperCard {
  const UiKitSwiperAdCard({
    super.key,
    super.tags = const [],
    super.imageLink,
    super.title = '',
    super.subtitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 267.w,
      height: 316.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all40,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageWidget(
            link: imageLink,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
