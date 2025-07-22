import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLargeAdBannerCard extends StatelessWidget implements AdvertisementFactory {
  final double availableWidth;
  final VoidCallback? onTap;
  final String imageLink;
  final String title;
  final double? customHeight;

  const UiKitLargeAdBannerCard({
    super.key,
    required this.availableWidth,
    this.onTap,
    this.customHeight,
    required this.imageLink,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.regularTextTheme;
    final height = availableWidth * 1.17;

    return Material(
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all40,
        side: BorderSide(
          color: Colors.white.withOpacity(0.15),
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: customHeight ?? height,
          width: availableWidth,
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            fit: StackFit.expand,
            children: [
              ImageWidget(
                link: imageLink,
                fit: BoxFit.cover,
                errorWidget: const UiKitBigPhotoErrorWidget(),
              ),
              Positioned(
                bottom: EdgeInsetsFoundation.vertical12,
                left: EdgeInsetsFoundation.horizontal12,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadiusFoundation.max,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Text(
                      title,
                      style: textTheme?.title1.copyWith(color: ColorsFoundation.lightSurface),
                    ).paddingSymmetric(
                      vertical: EdgeInsetsFoundation.vertical4,
                      horizontal: EdgeInsetsFoundation.horizontal16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
