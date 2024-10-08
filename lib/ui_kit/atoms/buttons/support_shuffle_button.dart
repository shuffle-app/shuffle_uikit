import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SupportShuffleButton extends StatelessWidget {
  final ValueChanged<int>? onDonate;
  final VoidCallback? onCustomDonate;

  const SupportShuffleButton({
    super.key,
    this.onDonate,
    this.onCustomDonate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Material(
      borderRadius: BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      color: context.uiKitTheme?.colorScheme.surface2,
      child: InkWell(
        onTap: onCustomDonate ??
            () => showGeneralDialog(
                  context: context,
                  transitionBuilder: (context, animation1, animation2, child) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: animation1.value * 30, sigmaY: animation1.value * 30),
                    child: child,
                  ),
                  pageBuilder: (context, animation1, animation2) => FadeTransition(
                    opacity: animation1,
                    child: DonateToShuffleAlert(onDonate: onDonate),
                  ),
                ),
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical10,
            horizontal: EdgeInsetsFoundation.horizontal12,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: S.of(context).Support,
                            style: theme?.regularTextTheme.body,
                          ),
                          TextSpan(
                            text: ' shuffle',
                            style: theme?.boldTextTheme.body.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    GradientableWidget(
                      gradient: GradientFoundation.attentionCard,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: S.of(context).Support,
                              style: theme?.regularTextTheme.body.copyWith(color: Colors.transparent),
                            ),
                            TextSpan(
                              text: ' shuffle',
                              style: theme?.boldTextTheme.body.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SpacingFoundation.horizontalSpace8,
              Container(
                width: 1,
                height: 20.h,
                color: theme?.colorScheme.surface4,
              ),
              SpacingFoundation.horizontalSpace8,
              GradientableWidget(
                gradient: GradientFoundation.attentionCard,
                child: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.coinGradient,
                  height: 20.h,
                  color: Colors.white,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
