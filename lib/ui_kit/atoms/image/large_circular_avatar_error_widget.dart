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
        color: ColorsFoundation.darkNeutral400.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsFoundation.darkNeutral400,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text.split(' ').map((e) => e.characters.first).join(''),
            style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ).paddingAll(EdgeInsetsFoundation.all4),
    );
  }
}
