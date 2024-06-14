import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shuffle_uikit.dart';

class UiKitViewHistoryTile extends StatelessWidget {
  const UiKitViewHistoryTile({
    super.key,
    required this.title,
    required this.points,
    required this.dateTime,
    this.isLast,
  });

  final String title;
  final int points;
  final DateTime dateTime;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '$points ${S.current.Points}',
                style: uiKitTheme?.boldTextTheme.caption1Bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SpacingFoundation.horizontalSpace8,
            Text(
              DateFormat('dd.MM.yyyy HH:mm').format(dateTime),
              style: uiKitTheme?.regularTextTheme.caption2
                  .copyWith(color: ColorsFoundation.mutedText),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace4,
        Text(
          title,
          style: uiKitTheme?.regularTextTheme.caption1,
        ),
        SpacingFoundation.verticalSpace16,
        if (!(isLast ?? false))
          Divider(color: uiKitTheme?.colorScheme.surface2, thickness: 2)
      ],
    );
  }
}
