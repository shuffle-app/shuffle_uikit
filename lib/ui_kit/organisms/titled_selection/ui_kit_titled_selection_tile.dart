import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledSelectionTile extends StatelessWidget {
  final String title;
  final List<String>? selectedItems;
  final VoidCallback? onSelectionChanged;
  // final ValueChanged<List<String>>? onChanged;

  const UiKitTitledSelectionTile({
    Key? key,
    required this.title,
    this.selectedItems,
    this.onSelectionChanged,
    // this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.regularTextTheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onSelectionChanged,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: textTheme?.labelSmall,
          ),
          SpacingFoundation.verticalSpace2,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  selectedItems?.join(', ') ?? 'No preferences chosen',
                  style: textTheme?.body,
                  maxLines: 1,
                ),
              ),
              ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.chevronRight,
                color: Colors.white,
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
