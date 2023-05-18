import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilterChip extends StatefulWidget {
  final String title;
  final bool selected;
  final VoidCallback? onPressed;
  final String icon;

  const UiKitTitledFilterChip({
    Key? key,
    required this.title,
    this.selected = false,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  State<UiKitTitledFilterChip> createState() => _UiKitTitledFilterChipState();
}

class _UiKitTitledFilterChipState extends State<UiKitTitledFilterChip> {
  late bool _selected = widget.selected;

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      color: _selected ? Colors.white : ColorsFoundation.surface2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          setState(() => _selected = !_selected);
          widget.onPressed?.call();
        },
        child: Ink(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageWidget(
                link: widget.icon,
                color: _selected ? Colors.black : Colors.white,
              ),
              SpacingFoundation.horizontalSpace8,
              Text(
                widget.title,
                style: titleStyle?.copyWith(
                  color: _selected ? Colors.black : Colors.white,
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontal: SpacingFoundation.horizontalSpacing16,
            vertical: SpacingFoundation.verticalSpacing12,
          ),
        ),
      ),
    );
  }
}
