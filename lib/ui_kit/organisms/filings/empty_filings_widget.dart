import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class EmptyFilingsWidget extends StatelessWidget {
  final String? level;
  final bool isAfterMidnight;
  const EmptyFilingsWidget({
    super.key,
    this.level,
    this.isAfterMidnight = false,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.of(context).Today,
          style: boldTextTheme?.title2,
        ).paddingOnly(
          top: SpacingFoundation.verticalSpacing6,
          bottom: SpacingFoundation.verticalSpacing24,
        ),
        Text(
          '${S.of(context).Oops}!',
          style: boldTextTheme?.caption1Bold,
        ),
        SpacingFoundation.verticalSpace16,
        isAfterMidnight
            ? Text(
                S.of(context).WeArePreparingChallengesForTomorrow,
                style: boldTextTheme?.caption1Bold,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing32)
            : SizedBox(
                width: 0.9.sw,
                child: Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${S.of(context).EmptyChallengeNo} ',
                              style: boldTextTheme?.caption1Bold,
                            ),
                            TextSpan(
                              text: level.currentStringChallenge(),
                              style: boldTextTheme?.caption1Bold.copyWith(color: Colors.transparent),
                            ),
                            TextSpan(
                              text: ' ${S.of(context).EmptyChallengeMessage.toLowerCase()}',
                              style: boldTextTheme?.caption1Bold,
                            ),
                          ],
                        ),
                      ),
                      GradientableWidget(
                        gradient: GradientFoundation.defaultLinearGradient,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${S.of(context).EmptyChallengeNo} ',
                                style: boldTextTheme?.caption1Bold.copyWith(color: Colors.transparent),
                              ),
                              TextSpan(
                                text: level.currentStringChallenge(),
                                style: boldTextTheme?.caption1Bold,
                              ),
                              TextSpan(
                                text: ' ${S.of(context).EmptyChallengeMessage.toLowerCase()}',
                                style: boldTextTheme?.caption1Bold.copyWith(color: Colors.transparent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}

extension CurrentStringChallenge on String? {
  String currentStringChallenge() {
    switch (this?.toLowerCase().trim()) {
      case 'easy':
        return S.current.EmptyChallengeEasy;
      case 'fair':
        return S.current.EmptyChallengeFair;
      case 'hardcore':
        return S.current.EmptyChallengeHardcode;
      default:
        return S.current.EmptyChallengeEasy;
    }
  }
}
