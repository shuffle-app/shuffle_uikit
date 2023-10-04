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
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
        side: BorderSide(
          color: ColorsFoundation.lightGrey.withOpacity(0.3),
          width: 1.w,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            // borderRadius: BorderRadiusFoundation.all24,
            color: backgroundColor,
            // border: Border.all(
            //   color: ColorsFoundation.lightGrey,
            //   width: 1,
            // ),
          ),
          width: relativeSize,
          height: relativeSize,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadiusFoundation.all24,
              //   child:
              ImageWidget(
                link: backgroundImageLink,
                fit: BoxFit.cover,
                // ),
              ),
              Text(
                title,
                style: context.uiKitTheme?.regularTextTheme.caption4Regular.copyWith(
                  color: context.uiKitTheme?.colorScheme.primary,
                ),
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
