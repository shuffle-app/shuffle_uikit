import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentVoiceReactionCard extends StatelessWidget {
  final String? imageLink;
  final String contentTitle;
  final List<UiKitTag> properties;
  final DateTime? datePosted;
  final UiKitAudioMessageTile audioMessage;

  const UiKitContentVoiceReactionCard({
    super.key,
    this.imageLink,
    required this.contentTitle,
    required this.properties,
    this.datePosted,
    required this.audioMessage,
  });

  double get imageWidth => 0.25.sw;

  double get imageHeight => imageWidth * 0.75;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusFoundation.all12,
              child: ImageWidget(
                link: imageLink,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
            SpacingFoundation.horizontalSpace12,
            Expanded(
              child: SizedBox(
                height: imageHeight,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          contentTitle,
                          style: boldTextTheme?.caption1Bold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (datePosted != null)
                          Text(
                            formatDifference(datePosted!),
                            style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
                          ),
                      ],
                    ),
                    UiKitTagsWidget(baseTags: properties),
                  ],
                ),
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace8,
        audioMessage,
      ],
    );
  }
}
