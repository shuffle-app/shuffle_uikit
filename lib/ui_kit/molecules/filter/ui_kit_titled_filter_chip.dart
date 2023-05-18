import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilterChip<T> extends StatefulWidget {
  final String title;
  final bool selected;
  final T? value;
  final ValueChanged<T?>? onPressed;
  final String icon;

  const UiKitTitledFilterChip({
    Key? key,
    required this.title,
    this.selected = false,
    this.value,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  State<UiKitTitledFilterChip<T>> createState() => _UiKitTitledFilterChipState<T>();
}

class _UiKitTitledFilterChipState<T> extends State<UiKitTitledFilterChip<T>> {
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
          if (_selected) {
            widget.onPressed?.call(widget.value);
          } else {
            widget.onPressed?.call(null);
          }
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
