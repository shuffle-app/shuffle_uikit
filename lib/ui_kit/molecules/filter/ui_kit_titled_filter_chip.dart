import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilterChip extends StatefulWidget {
  final String title;
  final bool selected;
  final ValueChanged<bool> onPressed;
  final SvgGenImage icon;

  const UiKitTitledFilterChip({
    Key? key,
    required this.title,
    this.selected = false,
    required this.onPressed,
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
      color: _selected ? Colors.white : ColorsFoundation.surface2,
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.all24,
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
          widget.onPressed(_selected);
        },
        child: Ink(
          height: 40.h,
          decoration: BoxDecoration(
            color: _selected ? Colors.white : ColorsFoundation.surface2,
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageWidget(
                svgAsset: widget.icon,
                color: _selected ? Colors.black : Colors.white,
              ),
              SpacingFoundation.horizontalSpace12,
              Text(
                widget.title,
                style: titleStyle?.copyWith(
                  color: _selected ? Colors.black : Colors.white,
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontal: EdgeInsetsFoundation.horizontal12,
            vertical: EdgeInsetsFoundation.vertical8,
          ),
        ),
      ),
    );
  }
}
