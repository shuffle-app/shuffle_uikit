import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFameItem extends StatelessWidget {
  final AssetGenImage? asset;

  const UiKitFameItem({super.key, this.asset});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final backgroundColor = theme?.colorScheme.grayForegroundColor.withOpacity(0.16);

    const listOfStars = {
      7: Offset(20, 15),
      6: Offset(25, -25),
      8: Offset(-30, 15),
      5: Offset(-10, 30),
      10: Offset(-20, -25),
    };

    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: 45 * pi / 180,
          child: SizedBox(
              height: 50,
              width: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.all8,
                    color: backgroundColor,
                    backgroundBlendMode: asset != null ? BlendMode.plus : null,
                    gradient: asset != null ? GradientFoundation.fameLinearGradient : null),
              )),
        ),
        if (asset != null)
          ImageWidget(
            rasterAsset: asset,
            height: 45,
            width: 45,
            fit: BoxFit.contain,
          ),
        ...listOfStars.entries
            .map((e) => Transform.translate(
                offset: e.value,
                child: asset != null
                    ? UiKitFloatingAnimation(
                        child: GradientableWidget(
                            active: asset != null,
                            gradient: GradientFoundation.defaultRadialGradient,
                            child: ImageWidget(
                              height: e.key.sp,
                              width: e.key.sp,
                              fit: BoxFit.contain,
                              svgAsset: GraphicsFoundation.instance.svg.star2,
                              color: asset != null ? Colors.white : backgroundColor,
                            )))
                    : GradientableWidget(
                        active: asset != null,
                        gradient: GradientFoundation.defaultRadialGradient,
                        child: ImageWidget(
                          height: e.key.sp,
                          width: e.key.sp,
                          fit: BoxFit.contain,
                          svgAsset: GraphicsFoundation.instance.svg.star2,
                          color: asset != null ? Colors.white : backgroundColor,
                        ))))
            .toList()
      ],
    );
  }
}
