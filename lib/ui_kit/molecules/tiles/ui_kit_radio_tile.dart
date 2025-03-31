import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRadioTile extends StatelessWidget {
  final bool selected;
  final String title;
  final VoidCallback? onTapped;
  final AutoSizeGroup? autoSizeGroup;

  const UiKitRadioTile({super.key, required this.selected, this.onTapped, required this.title, this.autoSizeGroup});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return InkWell(
      onTap: onTapped,
      child: Row(
        children: [
          UiKitRadio(selected: selected).paddingOnly(right: SpacingFoundation.horizontalSpacing12),
          Flexible(
              child: AutoSizeText(
            title,
            style: theme?.boldTextTheme.labelLarge,
            maxLines: 1,
            minFontSize: 8,
            group: autoSizeGroup,
          )),
        ],
      ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing12),
    );
  }
}
