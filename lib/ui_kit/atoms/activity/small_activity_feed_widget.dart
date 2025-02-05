import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallActivityFeedWidget extends StatelessWidget {
  final VoidCallback? onMyActionTap;
  final VoidCallback? onCommonActionTap;
  final int? commonCount;
  final int? myCount;

  const SmallActivityFeedWidget({
    super.key,
    this.onMyActionTap,
    this.onCommonActionTap,
    this.commonCount,
    this.myCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final isLight = theme?.themeMode == ThemeMode.light;
    final textColor = isLight ? colorScheme?.inversePrimary : colorScheme?.darkNeutral200;
    final gradient = isLight ? GradientFoundation.lightActivityGradient : GradientFoundation.blackActivityGradient;
    final isSmallDevice = 1.sw <= 380;

    return Row(
      children: [
        Flexible(
          child: GestureDetector(
            onTap: onMyActionTap,
            child: UiKitCardWrapper(
              height: 0.45.sw,
              borderRadius: BorderRadiusFoundation.all24r,
              border: BorderSide(width: 1.5.h, color: ColorsFoundation.neutral8),
              gradient: gradient,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.My,
                          style: theme?.regularTextTheme.caption1UpperCase.copyWith(color: textColor),
                        ),
                        SpacingFoundation.verticalSpace2,
                        Text(
                          '$myCount',
                          style: theme?.regularTextTheme.title1.copyWith(color: textColor),
                        ),
                      ],
                    ),
                  ).paddingOnly(top: 30.h, left: SpacingFoundation.horizontalSpacing16),
                  OverflowBox(
                    alignment: Alignment.centerRight,
                    child: Transform.translate(
                      //0.15.sw
                      offset: Offset(isSmallDevice ? 0.15.sw : 0.13.sw, 0),
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
                      offset: Offset(0.02.sw, 0.2.sw),
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
                          height: 0.4.sw,
                          fit: BoxFit.fitHeight,
                          color: colorScheme?.inversePrimary.withOpacity(0.3),
                          svgAsset: GraphicsFoundation.instance.svg.dancers,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Flexible(
          child: GestureDetector(
            onTap: onCommonActionTap,
            child: UiKitCardWrapper(
              height: 0.45.sw,
              borderRadius: BorderRadiusFoundation.all24r,
              border: BorderSide(width: 1.5.h, color: ColorsFoundation.neutral8),
              gradient: gradient,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.Common,
                          style: theme?.regularTextTheme.caption1UpperCase.copyWith(color: textColor),
                        ),
                        SpacingFoundation.verticalSpace2,
                        Text(
                          '$commonCount',
                          style: theme?.regularTextTheme.title1.copyWith(color: textColor),
                        ),
                      ],
                    ),
                  ).paddingOnly(top: 30.h, left: SpacingFoundation.horizontalSpacing16),
                  OverflowBox(
                    alignment: Alignment.centerRight,
                    child: Transform.translate(
                      offset: Offset(isSmallDevice ? -0.3.sw : -0.32.sw, 0),
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black26, Colors.transparent, Colors.transparent],
                            stops: [0.5, 0.65, 1.0],
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
                    maxWidth: double.infinity,
                    child: Transform.translate(
                      offset: Offset(0, 0.19.sw),
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
                          height: 0.4.sw,
                          fit: BoxFit.fitHeight,
                          color: colorScheme?.inversePrimary.withOpacity(0.3),
                          svgAsset: GraphicsFoundation.instance.svg.dancersDisco,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
