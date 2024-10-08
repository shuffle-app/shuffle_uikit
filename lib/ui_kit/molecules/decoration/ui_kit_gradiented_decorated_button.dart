import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGradientedDecoratedButton extends StatelessWidget {
  final String? iconPath;
  final IconData? iconData;

  const UiKitGradientedDecoratedButton({
    super.key,
    this.iconPath,
    this.iconData,
  }) : assert(iconPath == null || iconData == null,
            'Only one of iconPath or iconData must be provided in UiKitGradientedDecoratedButton');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.75.sw,
      height: 0.75.sw,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: ColorsFoundation.orange.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: ColorsFoundation.yellow.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
            ).paddingAll(EdgeInsetsFoundation.all32),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: ColorsFoundation.pink.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ).paddingAll(EdgeInsetsFoundation.all32 * 2),
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                border: GradientFoundation.gradientBorder,
                shape: BoxShape.circle,
                color: ColorsFoundation.surface5,
              ),
              child: Opacity(
                opacity: 0.25,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: GradientFoundation.defaultRadialGradient,
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(
                    width: 40.w,
                    height: 40.w,
                  ).paddingAll(EdgeInsetsFoundation.all4),
                ).paddingAll(EdgeInsetsFoundation.all8),
              ),
            ),
          ),
          Center(
            child: GradientableWidget(
              gradient: GradientFoundation.defaultRadialGradient,
              child: ImageWidget(
                link: iconPath,
                iconData: iconData,
                fit: BoxFit.cover,
                color: Colors.white,
                width: 40.w,
                height: 40.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
