import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPropertiesCloud extends StatelessWidget {
  const UiKitPropertiesCloud({
    super.key,
    required this.properties,
  });

  final List<UiKitCloudChip> properties;

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: uiKitTheme?.colorScheme.surface1,
        borderRadius: BorderRadiusFoundation.all12,
      ),
      child: SizedBox(
        width: 1.sw,
        child: Wrap(
          spacing: SpacingFoundation.horizontalSpacing12,
          runSpacing: SpacingFoundation.verticalSpacing12,
          children: properties,
        ).paddingAll(EdgeInsetsFoundation.all24),
      ),
    );
  }
}
