import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledSelectionTile extends StatelessWidget {
  final String title;
  final List<String>? selectedItems;
  final VoidCallback? onSelectionChanged;
  final String? imagePath;
  // final ValueChanged<List<String>>? onChanged;

  const UiKitTitledSelectionTile({
    super.key,
    required this.title,
    this.selectedItems,
    this.onSelectionChanged,
    this.imagePath,
    // this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textTheme = theme?.regularTextTheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onSelectionChanged,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (imagePath != null)
                ImageWidget(
                  link: imagePath,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ).paddingOnly(right: EdgeInsetsFoundation.horizontal4),
              Flexible(
                child: Text(
                  title,
                  style: textTheme?.labelSmall,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace2,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  selectedItems?.join(', ') ?? S.of(context).NoPreferencesChosen,
                  style: textTheme?.body,
                  maxLines: 1,
                ),
              ),
              ImageWidget(
                iconData: ShuffleUiKitIcons.chevronright,
                color: theme?.colorScheme.inversePrimary,
              ),
            ],
          ),
          SpacingFoundation.verticalSpace4,
          const Divider(
            height: 1,
            thickness: 1,
            color: ColorsFoundation.darkNeutral400,
          ),
        ],
      ),
    );
  }
}
