import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHeaderWithLeading extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const UiKitHeaderWithLeading({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.titleStyle,
    this.subtitleStyle,
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
              Text(
                title,
                style: titleStyle ?? textTheme?.caption1Bold,
              ),
              SpacingFoundation.verticalSpace2,
              Text(
                subtitle ?? '',
                style: subtitleStyle ?? textTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900),
              ),
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace12,
        trailing ?? const SizedBox(),
      ],
    );
  }
}
