import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPhotoSliderWithReactions extends StatelessWidget {
  final String title;
  final List<String> photos;
  final int? hearEyesReactions;
  final int? thumbsUpReactions;
  final int? sunglassesReactions;
  final int? fireReactions;
  final int? smileyReactions;

  const UiKitPhotoSliderWithReactions({
    super.key,
    required this.title,
    required this.photos,
    this.hearEyesReactions,
    this.thumbsUpReactions,
    this.sunglassesReactions,
    this.fireReactions,
    this.smileyReactions,
  });

  double get imageWidth => 0.75.sw;

  double get imageHeight => imageWidth * 0.583;

  bool get hasAnyReactions =>
      hearEyesReactions != null ||
      thumbsUpReactions != null ||
      sunglassesReactions != null ||
      fireReactions != null ||
      smileyReactions != null;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: imageHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadiusFoundation.all24,
              child: ImageWidget(
                link: photos.elementAt(index),
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
            itemCount: photos.length,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Text(
          title,
          style: boldTextTheme?.caption2Bold,
        ),
        SpacingFoundation.verticalSpace16,
        if (hasAnyReactions)
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (hearEyesReactions != null)
                UiKitEmojiReaction(
                  reactionsCount: hearEyesReactions!,
                  iconSvgGen: GraphicsFoundation.instance.svg.heartEyes,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (thumbsUpReactions != null)
                UiKitEmojiReaction(
                  reactionsCount: thumbsUpReactions!,
                  iconSvgGen: GraphicsFoundation.instance.svg.thumbsUpReversed,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (sunglassesReactions != null)
                UiKitEmojiReaction(
                  reactionsCount: sunglassesReactions!,
                  iconSvgGen: GraphicsFoundation.instance.svg.sunglasses,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (fireReactions != null)
                UiKitEmojiReaction(
                  reactionsCount: fireReactions!,
                  iconSvgGen: GraphicsFoundation.instance.svg.fireEmoji,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (smileyReactions != null)
                UiKitEmojiReaction(
                  reactionsCount: smileyReactions!,
                  iconSvgGen: GraphicsFoundation.instance.svg.smiley,
                ),
            ],
          ),
      ],
    );
  }
}
