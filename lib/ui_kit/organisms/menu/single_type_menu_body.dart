import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SingleTypeMenuBody<T> extends StatelessWidget {
  final String title;
  final List<UiKitMenuItem<T>> items;
  final ValueChanged<UiKitMenuItem<T>>? onSelected;

  const SingleTypeMenuBody({
    super.key,
    required this.title,
    required this.items,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SpacingFoundation.verticalSpace16,
        Text(
          title,
          style: boldTextTheme?.subHeadline,
          textAlign: TextAlign.center,
        ),
        SpacingFoundation.verticalSpace16,
        ...items
            .map<Widget>(
              (e) => UiKitMenuItemTile(
                item: e,
                onTap: () => onSelected?.call(e),
              ),
            )
            .toList(),
      ],
    );
  }
}
