import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSwiperAdCard extends BaseUiKitSwiperCard {
  final BaseUiKitAdvertisementBannerConfig adsData;

  const UiKitSwiperAdCard(
      {super.key,
      super.tags = const [],
      super.imageLink,
      super.title = '',
      super.subtitle = '',
      required this.adsData,
      super.id = 0});

  @override
  Widget build(BuildContext context) {
    if (adsData is BaseUiKitAdvertisementTextBannerData) {
      return context.advertisementTextBanner(data: adsData as BaseUiKitAdvertisementTextBannerData);
    } else {
      return context.advertisementImageBanner(data: adsData as BaseUiKitAdvertisementImageBannerData);
    }
  }
}
