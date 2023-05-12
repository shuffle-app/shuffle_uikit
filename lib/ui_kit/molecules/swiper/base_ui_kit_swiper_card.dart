import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitSwiperCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageLink;
  final List<UiKitTagWidget> tags;

  const BaseUiKitSwiperCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.tags,
    this.imageLink,
  }) : super(key: key);
}

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
    final titleStyle = textTheme?.body;
    final subtitleStyle = textTheme?.caption1Medium;

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
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.all40,
                  color: Colors.white.withOpacity(0.05),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: titleStyle,
                      ),
                      Text(
                        subtitle,
                        maxLines: 2,
                        style: subtitleStyle,
                      ),
                      SpacingFoundation.verticalSpace4,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: tags,
                        ),
                      ),
                    ],
                  ).paddingAll(EdgeInsetsFoundation.all12),
                ),
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all16),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
