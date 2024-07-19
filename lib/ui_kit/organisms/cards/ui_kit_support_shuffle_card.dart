import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSupportShuffle extends StatelessWidget {
  final ValueChanged<int>? onDonate;
  final VoidCallback? onCustomDonate;

  const UiKitSupportShuffle({
    super.key,
    this.onDonate,
    this.onCustomDonate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return UiKitCardWrapper(
      height: 1.sw <= 380 ? 95.h : 80.h,
      // height: 1.w < 380 ? 95.h : 80.h,
      width: 110.w,
      color: context.uiKitTheme?.colorScheme.surface1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).Support,
            style: theme?.boldTextTheme.caption1Medium.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
          ),
          Stack(
            fit: StackFit.passthrough,
            children: [
              GradientableWidget(
                gradient: GradientFoundation.attentionCard,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'shuffle',
                        style: theme?.boldTextTheme.body
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace4,
          GestureDetector(
            onTap: onCustomDonate ??
                () => showGeneralDialog(
                      context: context,
                      transitionBuilder:
                          (context, animation1, animation2, child) =>
                              BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: animation1.value * 30,
                          sigmaY: animation1.value * 30,
                        ),
                        child: child,
                      ),
                      pageBuilder: (context, animation1, animation2) =>
                          FadeTransition(
                        opacity: animation1,
                        child: DonateToShuffleAlert(onDonate: onDonate),
                      ),
                    ),
            child: GradientableWidget(
              gradient: GradientFoundation.attentionCard,
              child: ImageWidget(
                iconData: ShuffleUiKitIcons.dollarOutlined,
                height: 23.h,
                color: Colors.white,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
