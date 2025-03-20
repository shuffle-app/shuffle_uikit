import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRadioTile extends StatelessWidget {
  final bool selected;
  final String title;
  final VoidCallback? onTapped;

  const UiKitRadioTile({super.key, required this.selected, this.onTapped, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return InkWell(
      onTap: onTapped,
      child: Row(
        children: [
          UiKitRadio(selected: selected).paddingOnly(right: SpacingFoundation.horizontalSpacing12),
          Text(
            title,
            style: theme?.boldTextTheme.labelLarge,
          ),
        ],
      ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing12),
    );
  }
}
