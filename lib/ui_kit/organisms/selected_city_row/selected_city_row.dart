import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SelectedCityRow extends StatelessWidget {
  final VoidCallback? onTap;
  final ValueNotifier<String> selectedCity;
  const SelectedCityRow({
    super.key,
    this.onTap,
    required this.selectedCity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return GestureDetector(
      onTap: onTap,
      child: UiKitCardWrapper(
        borderRadius: BorderRadiusFoundation.all24r,
        color: theme?.colorScheme.surface3,
        child: Row(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: selectedCity,
                builder: (context, value, child) => Text(
                  value,
                  style: theme?.boldTextTheme.caption1Medium,
                ),
              ),
            ),
            ImageWidget(
              color: theme?.colorScheme.inversePrimary,
              iconData: ShuffleUiKitIcons.chevronright,
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all12),
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
