import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProUserBadge extends StatelessWidget {
  const ProUserBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return DynamicGradientPlate(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'shuffle',
            style: textTheme?.caption1Bold.copyWith(color: Colors.black),
          ),
          SpacingFoundation.horizontalSpace4,
          ProAccountMark(),
        ],
      ),
    );
  }
}
