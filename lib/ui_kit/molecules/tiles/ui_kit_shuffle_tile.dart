import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitShuffleTile extends StatelessWidget {
  const UiKitShuffleTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 0.125.sw,
          width: 0.125.sw,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: isLightTheme ? ColorsFoundation.darkNeutral900.withOpacity(0.4) : Colors.white.withOpacity(0.4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipOval(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  height: 0.125.sw,
                  width: 0.125.sw,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isLightTheme ? ColorsFoundation.darkNeutral500 : ColorsFoundation.neutral24,
                  ),
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: isLightTheme ? ColorsFoundation.f6f6f6.withOpacity(0.08) : ColorsFoundation.neutral8,
                    shape: BoxShape.circle,
                  ),
                  child: ImageWidget(
                    rasterAsset: GraphicsFoundation.instance.png.shuffleInfluencersFeedAvatar,
                    width: 0.125.sw,
                    height: 0.125.sw,
                    fit: BoxFit.cover,
                  ).paddingAll(EdgeInsetsFoundation.all2),
                ).paddingAll(EdgeInsetsFoundation.all2),
              ],
            ),
          ),
        ),
        SpacingFoundation.horizontalSpace8,
        GradientableWidget(
          gradient: GradientFoundation.defaultLinearGradient,
          child: Text(
            'Shuffle',
            style: boldTextTheme?.caption1Bold.copyWith(color: Colors.white),
          ),
        ),
        SpacingFoundation.horizontalSpace4,
        InfluencerAccountMark(),
      ],
    );
  }
}
