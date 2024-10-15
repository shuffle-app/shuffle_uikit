import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInfluencerProfileNewsTile extends StatelessWidget {
  final Widget? leading;
  final String? leadingImageLink;
  final String title;
  final String? titleDecorationIconLink;
  final IconData? titleDecorationIcon;
  final String? subtitle;
  final VoidCallback? onTap;

  const UiKitInfluencerProfileNewsTile({
    super.key,
    required this.title,
    this.leading,
    this.titleDecorationIconLink,
    this.titleDecorationIcon,
    this.leadingImageLink,
    this.subtitle,
    this.onTap,
  }) : assert(titleDecorationIconLink == null || titleDecorationIcon == null,
            'You can only provide one of the titleDecorationIconLink or titleDecorationIcon of UiKitInfluencerProfileNewsTile');

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          leading ??
              ClipRRect(
                borderRadius: BorderRadiusFoundation.all8,
                child: ImageWidget(
                  link: leadingImageLink,
                  width: 0.2875.sw,
                  height: 0.2875.sw * 0.58,
                  fit: BoxFit.cover,
                ),
              ),
          SpacingFoundation.horizontalSpace4,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: boldTextTheme?.caption1UpperCaseMedium,
                      textAlign: TextAlign.left,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    if (titleDecorationIconLink != null || titleDecorationIcon != null)
                      ImageWidget(
                        link: titleDecorationIconLink,
                        iconData: titleDecorationIcon,
                        color: colorScheme?.inversePrimary,
                      ),
                  ],
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: regularTextTheme?.caption3.copyWith(color: ColorsFoundation.mutedText),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
