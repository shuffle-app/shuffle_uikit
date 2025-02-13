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
    final textStyle = context.uiKitTheme?.regularTextTheme.caption4Semibold;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        if (reactionStatisticUiModel!.viewCount != null)
          ValueListenableBuilder(
            valueListenable: reactionStatisticUiModel!.viewCount!,
            builder: (_, viewCount, __) {
              return (viewCount != null && viewCount > 0)
                  ? ClipRRect(
                      borderRadius: BorderRadiusFoundation.all12,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${viewCount}',
                              style: textStyle,
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
                    ).paddingOnly(bottom: SpacingFoundation.verticalSpacing12)
                  : SizedBox.shrink();
            },
          ),
        if (reactionStatisticUiModel?.likeCount?.value != null)
          ValueListenableBuilder(
            valueListenable: reactionStatisticUiModel!.likeCount!,
            builder: (_, likeCount, __) {
              return (likeCount != null && likeCount > 0)
                  ? ClipRRect(
                      borderRadius: BorderRadiusFoundation.all12,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${likeCount}',
                              style: textStyle,
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
                  : SizedBox.shrink();
            },
          )
      ],
    );
  }
}
