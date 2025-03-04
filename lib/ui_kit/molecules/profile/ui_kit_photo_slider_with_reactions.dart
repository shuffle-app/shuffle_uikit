import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPhotoSliderWithReactions extends StatefulWidget {
  final List<InfluencerPhotoUiModel> photos;

  const UiKitPhotoSliderWithReactions({
    super.key,
    required this.photos,
  });

  double get imageWidth => 0.75.sw;
  double get imageHeight => imageWidth * 0.583;

  @override
  State<UiKitPhotoSliderWithReactions> createState() => _UiKitPhotoSliderWithReactionsState();
}

class _UiKitPhotoSliderWithReactionsState extends State<UiKitPhotoSliderWithReactions> {
  late PageController _pageController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.photos[_currentIndex];
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.imageHeight,
          child: PageView.builder(
            padEnds: false,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemCount: widget.photos.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                right: index == widget.photos.length - 1 ? 0 : SpacingFoundation.horizontalSpacing16,
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusFoundation.all24,
                child: ImageWidget(
                  link: widget.photos[index].url,
                  width: widget.imageWidth,
                  height: widget.imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SpacingFoundation.verticalSpace16,
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(0.1, 0.0),
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          layoutBuilder: (currentChild, previousChildren) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Stack(
                children: [
                  ...previousChildren,
                  if (currentChild != null) currentChild,
                ],
              ),
            );
          },
          child: Text(
            key: ValueKey(_currentIndex),
            item.title ?? '',
            style: boldTextTheme?.caption2Bold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        if ((item.heartEyeCount != null && item.heartEyeCount! > 0) ||
            (item.thumbsUpCount != null && item.thumbsUpCount! > 0) ||
            (item.sunglassesCount != null && item.sunglassesCount! > 0) ||
            (item.fireCount != null && item.fireCount! > 0) ||
            (item.smileyCount != null && item.smileyCount! > 0))
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (item.heartEyeCount != null && item.heartEyeCount! > 0)
                UiKitEmojiReaction(
                  reactionsCount: item.heartEyeCount!,
                  iconSvgGen: GraphicsFoundation.instance.svg.heartEyes,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (item.thumbsUpCount != null && item.thumbsUpCount! > 0)
                UiKitEmojiReaction(
                  reactionsCount: item.thumbsUpCount!,
                  iconSvgGen: GraphicsFoundation.instance.svg.thumbsUpReversed,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (item.sunglassesCount != null && item.sunglassesCount! > 0)
                UiKitEmojiReaction(
                  reactionsCount: item.sunglassesCount!,
                  iconSvgGen: GraphicsFoundation.instance.svg.sunglasses,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (item.fireCount != null && item.fireCount! > 0)
                UiKitEmojiReaction(
                  reactionsCount: item.fireCount!,
                  iconSvgGen: GraphicsFoundation.instance.svg.fireEmoji,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal2),
              if (item.smileyCount != null && item.smileyCount! > 0)
                UiKitEmojiReaction(
                  reactionsCount: item.smileyCount!,
                  iconSvgGen: GraphicsFoundation.instance.svg.smiley,
                ),
            ],
          )
      ],
    );
  }
}
