import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRatingBarWithStars extends StatefulWidget {
  final int? maxRating;
  final ValueChanged<int>? onRatingChanged;

  const UiKitRatingBarWithStars({
    super.key,
    this.maxRating,
    this.onRatingChanged,
  });

  @override
  State<UiKitRatingBarWithStars> createState() => _UiKitRatingBarWithStarsState();
}

class _UiKitRatingBarWithStarsState extends State<UiKitRatingBarWithStars> {
  int rating = 0;
  final width = 0.9.sw;
  late final height = width * 0.2777777;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final boldTextTheme = theme?.boldTextTheme;

    return UiKitCardWrapper(
      height: height,
      width: width,
      color: colorScheme?.surface1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.current.Rating,
                  style: boldTextTheme?.labelLarge,
                ),
                SpacingFoundation.verticalSpace2,
                SizedBox(
                  height: 25.w,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final selected = index < rating;
                      return GestureDetector(
                        onTap: () {
                          widget.onRatingChanged?.call(index + 1);
                          setState(() => rating = index + 1);
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: ImageWidget(
                            key: ValueKey(selected),
                            width: 24.w,
                            iconData: selected ? ShuffleUiKitIcons.starfill : ShuffleUiKitIcons.staroutline,
                            color: colorScheme?.inversePrimary,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
                    itemCount: widget.maxRating ?? 5,
                  ),
                ),
              ],
            ),
          ),
          ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.trippleArrowCliped,
            fit: BoxFit.fitHeight,
            height: height - (EdgeInsetsFoundation.vertical32),
          ),
        ],
      ).paddingOnly(
        top: EdgeInsetsFoundation.vertical16,
        bottom: EdgeInsetsFoundation.vertical16,
        left: EdgeInsetsFoundation.horizontal16,
      ),
    );
  }
}
