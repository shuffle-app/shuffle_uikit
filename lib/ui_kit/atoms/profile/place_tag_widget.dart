import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PlaceTagWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Color? textColor;
  final bool showSpacing;

  const PlaceTagWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.textColor,
    this.showSpacing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showSpacing) UiKitSpacing.horizontalSpace12,
        SvgPicture.asset(
          icon,
          package: 'shuffle_uikit',
        ),
        UiKitSpacing.horizontalSpace4,
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: textColor ?? UiKitColors.solidGreyText,
              ),
        )
      ],
    );
  }
}
