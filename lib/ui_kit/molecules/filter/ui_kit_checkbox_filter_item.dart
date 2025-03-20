import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCheckboxFilterItem extends StatelessWidget {
  final TitledFilterItem item;
  final bool isSelected;
  final ValueChanged<bool> onTap;

  const UiKitCheckboxFilterItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        UiKitCheckbox(
          isActive: isSelected,
          onChanged: () => onTap.call(!isSelected),
        ),
        SpacingFoundation.horizontalSpace12,
        Flexible(
          child: GestureDetector(
            onTap: () => onTap.call(!isSelected),
            child: Text(
              item.mask,
              style: boldTextTheme?.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
