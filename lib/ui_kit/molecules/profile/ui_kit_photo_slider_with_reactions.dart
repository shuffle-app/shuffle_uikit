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
    Key? key,
    required this.title,
    required this.photos,
    this.hearEyesReactions,
    this.thumbsUpReactions,
    this.sunglassesReactions,
    this.fireReactions,
    this.smileyReactions,
  }) : super(key: key);

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
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

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
                  iconPath: GraphicsFoundation.instance.svg.heartEyes.path,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (thumbsUpReactions != null)
                UiKitEmojiReaction(
                  reactionsCount: thumbsUpReactions!,
                  iconPath: GraphicsFoundation.instance.svg.thumbsUpReversed.path,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (sunglassesReactions != null)
                UiKitEmojiReaction(
                  reactionsCount: sunglassesReactions!,
                  iconPath: GraphicsFoundation.instance.svg.sunglasses.path,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (fireReactions != null)
                UiKitEmojiReaction(
                  reactionsCount: fireReactions!,
                  iconPath: GraphicsFoundation.instance.svg.fireEmoji.path,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (smileyReactions != null)
                UiKitEmojiReaction(
                  reactionsCount: smileyReactions!,
                  iconPath: GraphicsFoundation.instance.svg.smiley.path,
                ),
            ],
          ),
      ],
    );
  }
}
