import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BigActivityFeedWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final int? commonCount;

  const BigActivityFeedWidget({
    super.key,
    this.onTap,
    this.commonCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final isLight = theme?.themeMode == ThemeMode.light;
    final textColor = isLight ? colorScheme?.inversePrimary : colorScheme?.darkNeutral200;
    final gradient = isLight ? GradientFoundation.lightActivityGradient : GradientFoundation.blackActivityGradient;

    return GestureDetector(
      onTap: onTap,
      child: UiKitCardWrapper(
        width: 1.sw,
        height: 0.45.sw,
        borderRadius: BorderRadiusFoundation.all24r,
        gradient: gradient,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.Common.toUpperCase(),
                    style: theme?.boldTextTheme.caption1UpperCase.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SpacingFoundation.verticalSpace4,
                  Text(
                    '$commonCount',
                    style: theme?.regularTextTheme.title1.copyWith(color: textColor),
                  ),
                ],
              ),
            ).paddingAll(EdgeInsetsFoundation.all16),
            OverflowBox(
              alignment: Alignment.centerRight,
              child: Transform.translate(
                offset: Offset(1.sw <= 380 ? 0.14.sw : 0.13.sw, 0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black26, Colors.transparent, Colors.transparent],
                      stops: [0.5, 0.8, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.logo,
                  ),
                ),
              ),
            ),
            OverflowBox(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: Offset(0, 0.23.sw),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.white],
                      stops: [0.0, 0.5],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: ImageWidget(
                    width: 1.sw - SpacingFoundation.horizontalSpacing16 * 2,
                    height: 0.5.sw,
                    fit: BoxFit.fitWidth,
                    color: colorScheme?.inversePrimary.withOpacity(0.3),
                    svgAsset: GraphicsFoundation.instance.svg.dancersDisco,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
