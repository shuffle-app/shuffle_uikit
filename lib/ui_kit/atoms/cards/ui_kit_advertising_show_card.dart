import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitAdvertisingShowCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isBigShowUpPercent;
  const UiKitAdvertisingShowCard({
    super.key,
    this.onTap,
    this.isBigShowUpPercent = false,
  });

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.all12,
      color: context.uiKitTheme?.colorScheme.surface2,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: isBigShowUpPercent
                  ? [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${S.of(context).YourShowUpRatio} ',
                              style: regularTextTheme?.caption3,
                            ),
                            TextSpan(
                              text: S.of(context).IsOverX(70).toLowerCase(),
                              style: regularTextTheme?.caption3.copyWith(color: Colors.transparent),
                            ),
                            TextSpan(
                              text: '. \n',
                              style: regularTextTheme?.caption3,
                            ),
                            TextSpan(
                              text: S.of(context).KeepItUp,
                              style: regularTextTheme?.caption3,
                            ),
                          ],
                        ),
                      ),
                      GradientableWidget(
                        gradient: GradientFoundation.showUpGradient,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${S.of(context).YourShowUpRatio} ',
                                style: regularTextTheme?.caption3.copyWith(color: Colors.transparent),
                              ),
                              TextSpan(
                                text: S.of(context).IsOverX(70).toLowerCase(),
                                style: regularTextTheme?.caption3,
                              ),
                              TextSpan(
                                text: '. \n',
                                style: regularTextTheme?.caption3.copyWith(color: Colors.transparent),
                              ),
                              TextSpan(
                                text: S.of(context).KeepItUp,
                                style: regularTextTheme?.caption3.copyWith(color: Colors.transparent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  : [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${S.of(context).YourTurnoutRate} ',
                              style: regularTextTheme?.caption3,
                            ),
                            TextSpan(
                              text: S.of(context).IsLessThanX(70).toLowerCase(),
                              style: regularTextTheme?.caption3.copyWith(color: Colors.transparent),
                            ),
                            TextSpan(
                              text: '. \n',
                              style: regularTextTheme?.caption3,
                            ),
                            TextSpan(
                              text: S.of(context).UseOurToolsToImproveIt,
                              style: regularTextTheme?.caption3,
                            ),
                          ],
                        ),
                      ),
                      GradientableWidget(
                        gradient: GradientFoundation.showUpGradient,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${S.of(context).YourTurnoutRate} ',
                                style: regularTextTheme?.caption3.copyWith(color: Colors.transparent),
                              ),
                              TextSpan(
                                text: S.of(context).IsLessThanX(70).toLowerCase(),
                                style: regularTextTheme?.caption3,
                              ),
                              TextSpan(
                                text: '. \n',
                                style: regularTextTheme?.caption3.copyWith(color: Colors.transparent),
                              ),
                              TextSpan(
                                text: S.of(context).UseOurToolsToImproveIt,
                                style: regularTextTheme?.caption3.copyWith(color: Colors.transparent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
            ),
          ),
          SpacingFoundation.horizontalSpace4,
          context.smallOutlinedButton(
            data: BaseUiKitButtonData(
              backgroundColor: Colors.transparent,
              onPressed: onTap,
              iconWidget: ImageWidget(
                height: 12.h,
                iconData: ShuffleUiKitIcons.chevronright,
              ),
            ),
          )
        ],
      ).paddingAll(EdgeInsetsFoundation.all12),
    );
  }
}
