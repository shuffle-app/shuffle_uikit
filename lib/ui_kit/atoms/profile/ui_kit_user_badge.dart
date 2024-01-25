import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserBadge extends StatelessWidget {
  final UserTileType userType;

  const UiKitUserBadge({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    if (userType == UserTileType.premium) {
      return ImageWidget(
        iconData: ShuffleUiKitIcons.star2,
        color: theme?.colorScheme.inversePrimary,
        fit: BoxFit.cover,
        height: 16.w,
      );
    } else if (userType == UserTileType.influencer) {
      return GradientableWidget(
          gradient: GradientFoundation.starLinearGradient,
          child: ImageWidget(
            iconData: ShuffleUiKitIcons.star2,
            color: Colors.white,
            fit: BoxFit.cover,
            height: 16.w,
          ));
    } else if (userType == UserTileType.pro) {
      return GradientableWidget(
        gradient: GradientFoundation.premiumLinearGradient,
        child: Text(
          'pro',
          style: theme?.boldTextTheme.caption1Bold.copyWith(color: Colors.white),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
