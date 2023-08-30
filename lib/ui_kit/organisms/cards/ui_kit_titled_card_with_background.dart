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

    return Material(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
        side: BorderSide(
          color: ColorsFoundation.lightGrey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all24,
            color: backgroundColor,
            // border: Border.all(
            //   color: ColorsFoundation.lightGrey,
            //   width: 1,
            // ),
          ),
          width: relativeSize,
          height: relativeSize,
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusFoundation.all24,
                child: ImageWidget(
                  link: backgroundImageLink,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                style: context.uiKitTheme?.regularTextTheme.caption4Regular.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ).paddingOnly(
                top: EdgeInsetsFoundation.vertical8,
                left: EdgeInsetsFoundation.horizontal12,
                right: EdgeInsetsFoundation.horizontal12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
