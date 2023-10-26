import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SupportShuffleButton extends StatelessWidget {
  final ValueChanged<int>? onDonate;

  const SupportShuffleButton({
    Key? key,
    this.onDonate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Material(
      borderRadius: BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      color: context.uiKitTheme?.colorScheme.surface2,
      child: InkWell(
        onTap: () => showGeneralDialog(
          context: context,
          transitionBuilder: (context, animation1, animation2, child) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: animation1.value * 50, sigmaY: animation1.value * 50),
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
                            style: theme?.boldTextTheme.body.copyWith(color: Colors.transparent),
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
                              style: theme?.boldTextTheme.body,
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
              ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.dollarOutlined,
                height: 20.h,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
