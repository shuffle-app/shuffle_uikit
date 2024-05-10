import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediumTextAdBannerCard extends StatelessWidget implements AdvertisementFactory {
  final double availableWidth;
  final VoidCallback? onTap;
  final String imageLink;
  final Widget textWidget;
  final double? customHeight;
  final Alignment? textAlignment;
  final Offset? textOffset;
  final double? customPadding;
  final Widget? decoration;

  const UiKitMediumTextAdBannerCard({
    Key? key,
    required this.availableWidth,
    required this.imageLink,
    required this.textWidget,
    this.customPadding,
    this.decoration,
    this.textAlignment,
    this.onTap,
    this.textOffset,
    this.customHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
        side: BorderSide(
          color: Colors.white.withOpacity(0.15),
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: customHeight ?? availableWidth * 0.7583,
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
              if (textAlignment != null && textOffset == null)
                Align(
                  alignment: textAlignment!,
                  child: textWidget,
                ).paddingAll(customPadding ?? EdgeInsetsFoundation.all16),
              if (textAlignment == null && textOffset == null)
                Positioned.fill(child: textWidget.paddingAll(customPadding ?? EdgeInsetsFoundation.all16)),
              if (textOffset != null && textAlignment == null)
                Positioned(
                  top: textOffset!.dy.isNegative ? null : textOffset!.dy,
                  bottom: textOffset!.dy.isNegative ? textOffset!.dy.abs() : null,
                  left: textOffset!.dx.isNegative ? null : textOffset!.dx,
                  right: textOffset!.dx.isNegative ? textOffset!.dx.abs() : null,
                  child: textWidget,
                ),
              if (decoration != null) decoration!,
            ],
          ),
        ),
      ),
    );
  }
}
