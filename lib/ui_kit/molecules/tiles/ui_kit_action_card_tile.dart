import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitActionCardTile extends StatelessWidget {
  final String? leadingImagePath;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const UiKitActionCardTile({
    super.key,
    this.leadingImagePath,
    this.subtitle,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final leadingSize = 1.sw * 0.125;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (leadingImagePath != null) ...[
          ClipOval(
            child: ImageWidget(
              link: leadingImagePath!,
              width: leadingSize,
              height: leadingSize,
              fit: BoxFit.cover,
            ),
          ),
          SpacingFoundation.horizontalSpace8,
        ],
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: textTheme?.caption1Bold,
              ),
              SpacingFoundation.verticalSpace2,
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: textTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                ),
            ],
          ),
        ),
        if (onTap != null) ...[
          SpacingFoundation.horizontalSpace8,
          context.smallButton(
            data: BaseUiKitButtonData(
              icon: const ImageWidget(
                iconData: ShuffleUiKitIcons.chevronright,
                color: Colors.white,
              ),
              onPressed: onTap,
            ),
          ),
        ],
      ],
    );
  }
}
