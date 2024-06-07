import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitColoredLegendChip extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;

  const UiKitColoredLegendChip({
    Key? key,
    required this.text,
    this.color,
    this.gradient,
  })  : assert(color != null || gradient != null, 'Can\'t have both color and gradient'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadiusFoundation.max,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageWidget(
            iconData: ShuffleUiKitIcons.check,
            color: colorScheme?.inversePrimary,
          ),
          SpacingFoundation.horizontalSpace2,
          Text(
            text,
            style: regularTextTheme?.caption2,
          )
        ],
      ).paddingSymmetric(
        vertical: EdgeInsetsFoundation.vertical4,
        horizontal: EdgeInsetsFoundation.horizontal12,
      ),
    );
  }
}
