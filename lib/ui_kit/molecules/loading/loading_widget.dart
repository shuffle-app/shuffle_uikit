import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LoadingWidget extends StatelessWidget {
  final Function(BuildContext context)? onLoad;
  final bool showLoadingText;

  const LoadingWidget({
    super.key,
    this.onLoad,
    this.showLoadingText = false,
  });

  @override
  Widget build(BuildContext context) {
    if (onLoad != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => onLoad!(context));
    }
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;
    String lottiePath = isLightTheme
        ? GraphicsFoundation.instance.animations.lottie.shuffleLoaderWhiteTheme.path
        : GraphicsFoundation.instance.animations.lottie.shuffleLoaderBlackTheme.path;

    return Center(
      child: Hero(
          tag: 'hero-loading',
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            LottieBuilder.asset(
              lottiePath,
              repeat: true,
              animate: true,
              package: 'shuffle_uikit',
            ),
            if (showLoadingText) ...[
              SpacingFoundation.verticalSpace8,
              Shimmer(
                gradient: GradientFoundation.buttonGradient,
                child: Text(S.of(context).Loading, style: context.uiKitTheme?.boldTextTheme.caption1Bold),
              )
            ]
          ])),
    ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing32);
  }
}
