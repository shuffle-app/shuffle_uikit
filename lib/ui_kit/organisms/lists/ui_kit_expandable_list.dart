import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitExpandableList extends StatefulWidget {
  final List<Widget> items;
  final VoidCallback? onExpand;
  final String? itemsTitle;
  final double? horizontalMargin;

  const UiKitExpandableList({
    Key? key,
    required this.items,
    this.itemsTitle,
    this.onExpand,
    this.horizontalMargin,
  }) : super(key: key);

  @override
  State<UiKitExpandableList> createState() => _UiKitExpandableListState();
}

class _UiKitExpandableListState extends State<UiKitExpandableList> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.items.length > 4 && !expanded) ...[
          ...widget.items.map((e) => e.paddingOnly(bottom: EdgeInsetsFoundation.vertical16)).toList().sublist(0, 4),
          context
              .smallButton(
                data: BaseUiKitButtonData(
                  fit: ButtonFit.fitWidth,
                  text: S.current.NextElements(widget.items.length - 4).toUpperCase(),
                  iconInfo: BaseUiKitButtonIconData(
                    iconData: ShuffleUiKitIcons.chevrondown,
                  ),
                  onPressed: () {
                    widget.onExpand?.call();
                    setState(() => expanded = true);
                  },
                ),
              )
              .paddingSymmetric(horizontal: widget.horizontalMargin ?? 0),
        ],
        if (widget.items.length <= 4 || expanded)
          ...widget.items.map(
            (e) => e.paddingOnly(bottom: EdgeInsetsFoundation.vertical16),
          ),
      ],
    );
  }
}
