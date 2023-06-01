import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledSelectionTile extends StatelessWidget {
  final String title;
  final List<String> selectableItems;
  final List<String>? selectedItems;
  final ValueChanged<List<String>>? onChanged;

  const UiKitTitledSelectionTile({
    Key? key,
    required this.selectableItems,
    required this.title,
    this.selectedItems,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.regularTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: textTheme?.labelSmall,
        ),
        SpacingFoundation.verticalSpace4,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                selectedItems?.join(', ') ?? '',
                style: textTheme?.body,
              ),
            ),
            ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.chevronRight,
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
    );
  }
}
