import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilter extends StatelessWidget {
  final TitledFilterModel model;
  final ValueChanged<TitledFilterItem>? onItemSelected;
  final ValueChanged<TitledFilterItem>? onItemDeselected;

  const UiKitTitledFilter({
    Key? key,
    required this.model,
    this.onItemSelected,
    this.onItemDeselected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.title,
          style: boldTextTheme?.title2,
        ),
        SpacingFoundation.verticalSpace16,
        ...model.items.map(
          (item) => UiKitCheckboxFilterItem(
            item: item,
            isSelected: item.value == model.selectedItem?.value,
            onTap: (selected) {
              if (selected) onItemSelected?.call(item);
              if (!selected) onItemDeselected?.call(item);
            },
          ),
        ),
      ],
    );
  }
}
