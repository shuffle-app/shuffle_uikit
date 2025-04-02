import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSwiperCard extends BaseUiKitSwiperCard {
  final ScrollController? tagsScrollController;
  final PlaceWeatherType? weatherType;

  const UiKitSwiperCard({
    super.key,
    super.imageLink,
    super.onTap,
    super.pointsToGain,
    super.width,
    required super.tags,
    required super.id,
    required super.title,
    required super.subtitle,
    this.tagsScrollController,
    this.weatherType,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final cardWidth = kIsWeb ? width ?? 267.0 : width ?? 267.w;
    final height = cardWidth / 0.78125;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: cardWidth,
          height: height,
          child: ClipRRect(
              borderRadius: BorderRadiusFoundation.all40,
              child: ColoredBox(
                color: Colors.grey,
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
                    if (weatherType != null)
                      Positioned(
                        top: 12.w,
                        left: 12.w,
                        child: UiKitPlaceWeatherAnimation(
                          weatherType: weatherType!,
                        ),
                      ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: pointsToGain == null
                              ? null
                              : DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusFoundation.all40,
                                    gradient: GradientFoundation.defaultRadialGradient,
                                  ),
                                  child: Text(
                                    '+$pointsToGain',
                                    style: textTheme?.caption1Bold.copyWith(color: Colors.black),
                                  ).paddingSymmetric(
                                    vertical: EdgeInsetsFoundation.vertical8,
                                    horizontal: EdgeInsetsFoundation.horizontal12,
                                  ),
                                ),
                        ),
                        UiKitSwiperCardInfo(
                          scrollController: tagsScrollController,
                          title: title,
                          subtitle: subtitle,
                          tags: tags,
                        ),
                      ],
                    ).paddingAll(EdgeInsetsFoundation.all16),
                  ],
                ),
              ))).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
