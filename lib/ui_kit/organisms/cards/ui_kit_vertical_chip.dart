import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVerticalChip extends StatelessWidget {
  final String caption;
  final ImageWidget sign;
  final VoidCallback? onTap;
  final bool selected;
  final AutoSizeGroup? autoSizeGroup;
  final Size? size;

  const UiKitVerticalChip({
    super.key,
    required this.caption,
    required this.sign,
    this.onTap,
    this.size,
    this.autoSizeGroup,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? context.uiKitTheme?.colorScheme.inversePrimary.withOpacity(0.12)
          : context.uiKitTheme?.colorScheme.surface2,
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: size?.width,
          height: size?.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              sign,
              SpacingFoundation.verticalSpace12,
              AutoSizeText(
                caption,
                group: autoSizeGroup,
                minFontSize: 8.w,
                stepGranularity: 8.w / 8,
                maxLines: 1,
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
