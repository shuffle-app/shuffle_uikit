import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/common/gradient_linear_indicator.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/ui_reward_progress_model.dart';

class UiKitFameItemDialog extends StatelessWidget {
  final UiRewardProgressModel? uiRewardProgressModel;
  final String filePath;
  final String filePoster;

  const UiKitFameItemDialog({
    super.key,
    this.uiRewardProgressModel,
    required this.filePath,
    required this.filePoster,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: ImageWidget(
              iconData: ShuffleUiKitIcons.cross,
              color: theme?.colorScheme.darkNeutral900,
              height: 19.h,
              fit: BoxFit.fitHeight,
            ),
          ),
          SpacingFoundation.verticalSpace16,
          UiKitCardWrapper(
            color: theme?.colorScheme.surface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  uiRewardProgressModel?.title ?? S.of(context).NothingFound,
                  style: theme?.boldTextTheme.title2,
                ),
                SizedBox(height: 35.h),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: 45 * math.pi / 180,
                        child: SizedBox(
                          height: 1.sw <= 380 ? 150 : 250,
                          width: 1.sw <= 380 ? 150 : 250,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusFoundation.all24r,
                              color: ColorsFoundation.darkNeutral100.withOpacity(0.16),
                              backgroundBlendMode: BlendMode.plus,
                              gradient: GradientFoundation.fameLinearGradient,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.sw <= 380 ? 150 : 250,
                        width: 1.sw <= 380 ? 150 : 250,
                        child: UiKitBase3DViewer(
                          localPath: filePath,
                          poster: filePoster,
                          autoRotate: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).PointsAndLevels,
                        style: theme?.boldTextTheme.caption2Bold,
                      ),
                      TextSpan(
                        text: '${S.of(context).UsersCanEarnPointsOrLevelUpBasedOnTheirAchievements}\n',
                        style: theme?.regularTextTheme.caption2,
                      ),
                      TextSpan(
                        text: S.of(context).UnlockableRewards,
                        style: theme?.boldTextTheme.caption2Bold,
                      ),
                      TextSpan(
                        text: S.of(context).SpecialFeaturesCharmsOrBadges,
                        style: theme?.regularTextTheme.caption2,
                      ),
                    ],
                  ),
                ),
                if (uiRewardProgressModel != null) ...[
                  SpacingFoundation.verticalSpace16,
                  Text(
                    S.of(context).ReviewsCount(uiRewardProgressModel?.total.toInt() ?? 1),
                    style: theme?.boldTextTheme.body,
                  ),
                  SpacingFoundation.verticalSpace4,
                  Row(
                    children: [
                      Text(
                        S.of(context).YourProgress,
                        style: theme?.regularTextTheme.caption1,
                      ),
                      const Spacer(),
                      Text(
                        '${uiRewardProgressModel?.current.toInt() ?? 0}/${uiRewardProgressModel?.total.toInt() ?? 1}',
                        style: theme?.regularTextTheme.caption1,
                      ),
                    ],
                  ),
                  SpacingFoundation.verticalSpace2,
                  GradientLinearIndicator(
                    width: 0.7.sw,
                    actualSum: uiRewardProgressModel?.current ?? 0.0,
                    sum: uiRewardProgressModel?.total ?? 1.0,
                  ),
                ]
              ],
            ).paddingAll(EdgeInsetsFoundation.all24),
          )
        ],
      ),
    );
  }
}
