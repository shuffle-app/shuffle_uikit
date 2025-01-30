import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHeaderWithLeading extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Widget? titleIcon;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? noShows;

  const UiKitHeaderWithLeading({
    super.key,
    required this.title,
    this.titleIcon,
    this.subtitle,
    this.leading,
    this.trailing,
    this.titleStyle,
    this.subtitleStyle,
    this.noShows,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leading ?? const SizedBox(),
        SpacingFoundation.horizontalSpace12,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Flexible(
                    child: Text(
                  title,
                  style: (titleStyle ?? textTheme?.caption1Bold)?.copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                )),
                if (titleIcon != null) ...[SpacingFoundation.horizontalSpace12, titleIcon!]
              ]),
              Text(
                subtitle ?? '',
                style: subtitleStyle ?? textTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900),
              ),
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace12,
        noShows ?? const SizedBox(),
        SpacingFoundation.horizontalSpace12,
        trailing ?? const SizedBox(),
      ],
    );
  }
}
