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
    final relativeSize = SizesFoundation.screenWidth * 0.375;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        color: backgroundColor,
      ),
      width: relativeSize,
      height: relativeSize,
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            ImageWidget(
              link: backgroundImageLink,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: context.uiKitTheme?.regularTextTheme.caption4Regular.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ).paddingOnly(
                top: EdgeInsetsFoundation.vertical8,
                left: EdgeInsetsFoundation.horizontal12,
                right: EdgeInsetsFoundation.horizontal12),
            // Material(
            //   clipBehavior: Clip.hardEdge,
            //   borderRadius: BorderRadiusFoundation.all24,
            //   color: Colors.transparent,
            //   child: InkWell(
            //     onTap: onPressed,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
