import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BigAvatarErrorWidget extends StatelessWidget {
  final String text;

  const BigAvatarErrorWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all20,
        color: Colors.grey.withOpacity(0.4),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all12,
          color: ColorsFoundation.darkNeutral400,
        ),
        child: Center(
          child: Text(
            text,
            style: context.uiKitTheme?.boldTextTheme.body.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
          ),
        ),
      ).paddingAll(EdgeInsetsFoundation.all8),
    );
  }
}
