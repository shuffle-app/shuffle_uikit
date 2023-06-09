import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSwiperCard extends BaseUiKitSwiperCard {
  const UiKitSwiperCard({
    super.key,
    super.imageLink,
    required super.tags,
    required super.title,
    required super.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final infoCard = UiKitSwiperCardInfo(
      title: title,
      subtitle: subtitle,
      tags: tags,
    );

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
          ClipRRect(
            borderRadius: BorderRadiusFoundation.all40,
            child: ImageWidget(
              link: imageLink,
              fit: BoxFit.cover,
              errorWidget: const UiKitBigPhotoErrorWidget(),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.all40,
                    gradient: GradientFoundation.defaultRadialGradient,
                  ),
                  child: Text(
                    '+20',
                    style: textTheme?.caption1Bold.copyWith(color: Colors.black),
                  ).paddingSymmetric(
                    vertical: EdgeInsetsFoundation.vertical8,
                    horizontal: EdgeInsetsFoundation.horizontal12,
                  ),
                ),
              ),
              infoCard,
            ],
          ).paddingAll(EdgeInsetsFoundation.all16),
        ],
      ),
    );
  }
}
