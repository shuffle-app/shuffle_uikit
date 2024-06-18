import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class VideoReactionsModeration extends StatelessWidget {
  final Function() playFunction;
  final List<String> listVideoImage;
  final FeedbackInfo feedbackInfo;

  const VideoReactionsModeration({
    super.key,
    required this.playFunction,
    required this.listVideoImage,
    required this.feedbackInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Row(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      listVideoImage.first,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.0.sw,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          context.iconButtonNoPadding(
                            data: BaseUiKitButtonData(
                              iconInfo: BaseUiKitButtonIconData(
                                iconData: ShuffleUiKitIcons.volume,
                              ),
                            ),
                          ),
                          SpacingFoundation.horizontalSpace24,
                          Text(
                            '1:00',
                            style: theme?.boldTextTheme.caption2Bold,
                          ),
                        ],
                      ).paddingSymmetric(
                        vertical: SpacingFoundation.verticalSpacing8,
                        horizontal: SpacingFoundation.horizontalSpacing16,
                      ),
                    ),
                    const Spacer(),
                    IntrinsicHeight(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Row(
                          children: [
                            context
                                .iconButtonNoPadding(
                                  data: BaseUiKitButtonData(
                                    onPressed: playFunction,
                                    iconInfo: BaseUiKitButtonIconData(
                                      iconData: ShuffleUiKitIcons.playfill,
                                    ),
                                  ),
                                )
                                .paddingSymmetric(
                                    horizontal:
                                        SpacingFoundation.horizontalSpacing8,
                                    vertical:
                                        SpacingFoundation.verticalSpacing24),
                            SizedBox(
                              child: VerticalDivider(
                                color: theme?.colorScheme.darkNeutral400,
                                thickness: 1.0,
                              ),
                            ),
                            ColoredBox(
                              color: theme?.colorScheme.darkNeutral400 ??
                                  Colors.white,
                              child: Row(
                                children: List.generate(
                                  listVideoImage.length,
                                  (index) {
                                    return SizedBox(
                                      height: 0.1.sh,
                                      child: ImageWidget(
                                        colorBlendMode: BlendMode.lighten,
                                        link: listVideoImage[index],
                                      ),
                                    ).paddingAll(2.0);
                                  },
                                ),
                              ),
                            ).paddingAll(8.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: feedbackInfo,
        ),
      ],
    );
  }
}
