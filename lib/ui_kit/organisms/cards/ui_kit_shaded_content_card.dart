import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitShadedContentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool recommended;
  final VoidCallback? onPressed;
  final String? imageUrl;

  /// available screen width is required to determine correct size of the card
  /// otherwise these no other choice but to use [LayoutBuilder], which is not
  /// preferable because it may cause performance issues
  final double availableWidth;

  const UiKitShadedContentCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.recommended,
    required this.availableWidth,
    this.onPressed,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardHeight = availableWidth * 0.583;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          width: availableWidth,
          height: cardHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ImageWidget(
                link: imageUrl,
                width: availableWidth,
                height: cardHeight,
                fit: BoxFit.cover,
                errorWidget: const UiKitBigPhotoErrorWidget(),
              ),
              Container(
                height: cardHeight,
                width: availableWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.all24,
                  gradient: GradientFoundation.blackLinearGradient,
                ),
              ),
              if (recommended)
                Positioned(
                  top: SpacingFoundation.verticalSpacing12,
                  left: SpacingFoundation.horizontalSpacing12,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusFoundation.all24,
                      gradient: GradientFoundation.donationLinearGradient,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: EdgeInsetsFoundation.horizontal12,
                      vertical: EdgeInsetsFoundation.vertical6,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.thumbUp,
                          color: Colors.black,
                          height: 16,
                          fit: BoxFit.fitHeight,
                        ),
                        SpacingFoundation.horizontalSpace4,
                        Text(
                          S.current.Recommended.toLowerCase(),
                          style: regularTextTheme?.caption4Regular.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                width: availableWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: boldTextTheme?.caption1Bold.copyWith(overflow: TextOverflow.ellipsis),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                    SpacingFoundation.verticalSpace4,
                    Text(
                      subtitle,
                      style: boldTextTheme?.caption1Bold.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: ColorsFoundation.mutedText,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  ],
                ).paddingAll(EdgeInsetsFoundation.all12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
