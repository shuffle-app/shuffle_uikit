import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledCardWithBackground extends StatelessWidget {
  final String title;
  final String backgroundImageLink;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const UiKitTitledCardWithBackground({
    super.key,
    required this.title,
    required this.backgroundImageLink,
    required this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil();
    final designHeight = screenUtil.screenHeight / screenUtil.scaleHeight;
    const designCardHeight = 116;
    final relativeSize = (designCardHeight / designHeight) * screenUtil.screenHeight;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        color: backgroundColor,
      ),
      width: relativeSize,
      height: relativeSize,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ).paddingOnly(
            top: EdgeInsetsFoundation.vertical12,
            left: EdgeInsetsFoundation.horizontal12,
            right: EdgeInsetsFoundation.horizontal12,
          ),
          ImageWidget(
            link: backgroundImageLink,
            fit: BoxFit.cover,
          ),
          Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadiusFoundation.all24,
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
