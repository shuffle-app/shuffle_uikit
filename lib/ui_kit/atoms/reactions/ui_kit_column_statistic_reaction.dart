import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitColumnStatisticReaction extends StatelessWidget {
  final ReactionStatisticUiModel? reactionStatisticUiModel;

  const UiKitColumnStatisticReaction({
    super.key,
    this.reactionStatisticUiModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (reactionStatisticUiModel!.viewCount != null && reactionStatisticUiModel!.viewCount! > 0)
          ClipRRect(
            borderRadius: BorderRadiusFoundation.all12,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${reactionStatisticUiModel!.viewCount}',
                    style: context.uiKitTheme?.regularTextTheme.caption4Semibold,
                  ),
                  SpacingFoundation.horizontalSpace8,
                  ImageWidget(
                    height: 16.w,
                    width: 16.w,
                    iconData: ShuffleUiKitIcons.view,
                    color: Colors.white,
                  ),
                ],
              ).paddingSymmetric(
                horizontal: SpacingFoundation.horizontalSpacing8,
                vertical: SpacingFoundation.verticalSpacing4,
              ),
            ),
          ).paddingOnly(bottom: SpacingFoundation.verticalSpacing12),
        if (reactionStatisticUiModel!.likeCount != null && reactionStatisticUiModel!.likeCount! > 0)
          ClipRRect(
            borderRadius: BorderRadiusFoundation.all12,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${reactionStatisticUiModel!.likeCount}',
                    style: context.uiKitTheme?.regularTextTheme.caption4Semibold,
                  ),
                  SpacingFoundation.horizontalSpace8,
                  ImageWidget(
                    height: 16.w,
                    width: 16.w,
                    iconData: ShuffleUiKitIcons.heartoutline,
                    color: Colors.white,
                  ),
                ],
              ).paddingSymmetric(
                horizontal: SpacingFoundation.horizontalSpacing8,
                vertical: SpacingFoundation.verticalSpacing4,
              ),
            ),
          )
      ],
    );
  }
}
