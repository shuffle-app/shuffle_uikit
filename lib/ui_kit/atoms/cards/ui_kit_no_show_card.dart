import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitNoShowCard extends StatelessWidget {
  final int noShows;
  const UiKitNoShowCard({
    super.key,
    required this.noShows,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.all8,
      color: theme?.colorScheme.surface2,
      child: Column(
        children: [
          Text(
            S.of(context).NoShows.toLowerCase(),
            style: theme?.regularTextTheme.caption4.copyWith(color: ColorsFoundation.mutedText),
          ),
          Text(
            '${noShows}%',
            style: theme?.regularTextTheme.caption4,
          ),
        ],
      ).paddingSymmetric(
        horizontal: SpacingFoundation.horizontalSpacing4,
        vertical: SpacingFoundation.verticalSpacing8,
      ),
    );
  }
}
