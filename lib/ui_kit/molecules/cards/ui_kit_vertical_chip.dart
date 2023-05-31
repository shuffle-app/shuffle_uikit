import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVerticalChip extends StatelessWidget {
  final String caption;
  final ImageWidget sign;
  final VoidCallback? onTap;
  final bool selected;

  const UiKitVerticalChip({
    Key? key,
    required this.caption,
    required this.sign,
    this.onTap,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? ColorsFoundation.darkNeutral900 : ColorsFoundation.surface2,
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              sign,
              SpacingFoundation.verticalSpace12,
              Text(
                caption,
                style: context.uiKitTheme?.boldTextTheme.caption1Bold,
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all12),
        ),
      ),
    );
  }
}

class UiKitSignWithCaptionModel {
  final String caption;
  final ImageWidget sign;

  UiKitSignWithCaptionModel({
    required this.caption,
    required this.sign,
  });
}
