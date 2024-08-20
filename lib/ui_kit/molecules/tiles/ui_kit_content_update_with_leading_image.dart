import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentUpdateWithLeadingImage extends UiKitContentUpdateWidget {
  final String updateIconUrl;

  const UiKitContentUpdateWithLeadingImage({
    Key? key,
    required String imageUrl,
    required this.updateIconUrl,
    required super.title,
    super.subtitle,
  }) : super(leadingImageUrl: imageUrl);

  @override
  double get height => 0.16875.sw * 0.74;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusFoundation.all8,
            child: ImageWidget(
              width: 0.16875.sw,
              height: height,
              link: leadingImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SpacingFoundation.horizontalSpace8,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      title ?? '',
                      style: boldTextTheme?.caption3Medium,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    ImageWidget(
                      link: updateIconUrl,
                      color: colorScheme?.inverseSurface,
                      height: 0.040625.sw,
                      width: 0.040625.sw,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                if (subtitle != null)
                  Flexible(
                    child: Text(
                      subtitle!,
                      style: boldTextTheme?.caption3Medium.copyWith(color: ColorsFoundation.mutedText),
                      maxLines: 2,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
