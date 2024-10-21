import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLineChartTitledStat extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const UiKitLineChartTitledStat({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title.toUpperCase(),
          style: regularTextTheme?.caption4Regular,
          overflow: TextOverflow.ellipsis,
        ),
        SpacingFoundation.verticalSpace2,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: EdgeInsetsFoundation.vertical4,
              height: EdgeInsetsFoundation.vertical4,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            SpacingFoundation.horizontalSpace2,
            Text(
              value,
              style: regularTextTheme?.caption2.copyWith(color: color),
            ),
          ],
        ),
      ],
    );
  }
}
