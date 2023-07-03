import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCompactTextCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const UiKitCompactTextCard({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      color: ColorsFoundation.surface2,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: Text(
            text,
            style: textTheme?.caption1Bold,
          ).paddingSymmetric(
            vertical: EdgeInsetsFoundation.vertical12,
            horizontal: EdgeInsetsFoundation.horizontal16,
          ),
        ),
      ),
    );
  }
}
