// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLastSwiperCard extends BaseUiKitSwiperCard {
  final double? height;
  @override
  final double? width;

  UiKitLastSwiperCard({
    super.key,
    this.height,
    this.width,
  }) : super(tags: [], title: '', subtitle: '', id: 0);

  UiKitLastSwiperCard.fixed({super.key})
      : width = 267.w,
        height = 316.h,
        super(tags: [], title: '', subtitle: '', id: 0);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.all40,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).Ooops,
            style: textTheme?.body.copyWith(color: ColorsFoundation.darkNeutral900),
            textAlign: TextAlign.center,
          ),
          SpacingFoundation.verticalSpace4,
          const ImageWidget(
            iconData: ShuffleUiKitIcons.checkcircle,
          ),
          SpacingFoundation.verticalSpace4,
          Text(
            S.of(context).ThatsAllForNow,
            style: textTheme?.body.copyWith(color: ColorsFoundation.darkNeutral900),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).paddingAll(EdgeInsetsFoundation.all16);
  }
}
