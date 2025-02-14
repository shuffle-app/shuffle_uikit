import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitColumnStatisticReaction extends StatelessWidget {
  final ValueNotifier<ReactionStatisticUiModel?>? reactionStatisticUiModel;

  const UiKitColumnStatisticReaction({
    super.key,
    this.reactionStatisticUiModel,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.regularTextTheme.caption4Semibold;
    return reactionStatisticUiModel != null
        ? ValueListenableBuilder(
            valueListenable: reactionStatisticUiModel!,
            builder: (_, value, __) {
              final likeCountIsNotNull = (value?.likeCount != null && value!.likeCount! > 0);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  (value?.viewCount != null && value!.viewCount! > 0)
                      ? ClipRRect(
                          borderRadius: BorderRadiusFoundation.all12,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${value.viewCount}',
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
                        ).paddingOnly(bottom: likeCountIsNotNull ? SpacingFoundation.verticalSpacing12 : 0.0)
                      : SizedBox.shrink(),
                  likeCountIsNotNull
                      ? ClipRRect(
                          borderRadius: BorderRadiusFoundation.all12,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${value.likeCount}',
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
                      : SizedBox.shrink()
                ],
              );
            },
          )
        : SizedBox.shrink();
  }
}
