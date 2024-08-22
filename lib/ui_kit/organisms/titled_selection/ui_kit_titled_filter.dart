import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilter<T> extends StatelessWidget {
  final TitledFilterModel<T> model;
  final ValueChanged<TitledFilterItem<T>>? onItemSelected;
  final ValueChanged<TitledFilterItem<T>>? onItemDeselected;

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
          (item) {
            final isLastItem = model.items.last.mask == item.mask;

            return UiKitCheckboxFilterItem(
              item: item,
              isSelected: item.selected,
              onTap: (selected) {
                if (selected) onItemSelected?.call(item);
                if (!selected) onItemDeselected?.call(item);
              },
            ).paddingOnly(bottom: isLastItem ? 0 : EdgeInsetsFoundation.vertical16);
          },
        ),
      ],
    );
  }
}
