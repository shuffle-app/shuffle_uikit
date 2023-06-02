import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LargeCircularAvatarErrorWidget extends StatelessWidget {
  final String text;

  const LargeCircularAvatarErrorWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: ColorsFoundation.darkNeutral500.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsFoundation.darkNeutral400,
          shape: BoxShape.circle,
        ),
        child: Text(
          text,
          style: context.uiKitTheme?.boldTextTheme.body.copyWith(
            color: ColorsFoundation.darkNeutral900,
          ),
        ),
      ),
    );
  }
}
