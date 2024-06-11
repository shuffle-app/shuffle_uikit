import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCloudChip extends StatelessWidget {
  const UiKitCloudChip({
    super.key,
    this.onTap,
    required this.title,
  });

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: uiKitTheme?.colorScheme.darkNeutral900 ?? Colors.black,
        ),
        borderRadius: BorderRadiusFoundation.all6,
        color: uiKitTheme?.colorScheme.surface.withOpacity(0.1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadiusFoundation.all6,
          child: Text(
            title,
            style: uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
              color: uiKitTheme.colorScheme.bodyTypography,
            ),
            textAlign: TextAlign.center,
          ).paddingAll(EdgeInsetsFoundation.all4),
        ),
      ),
    );
  }
}
