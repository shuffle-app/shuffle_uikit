import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitExpandableList extends StatefulWidget {
  final List<Widget> items;
  final VoidCallback? onExpand;
  final String? itemsTitle;

  const UiKitExpandableList({
    Key? key,
    required this.items,
    this.itemsTitle,
    this.onExpand,
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
          context.smallButton(
            data: BaseUiKitButtonData(
              fit: ButtonFit.fitWidth,
              text: '${S.current.NextElements(widget.items.length - 4)} ${widget.itemsTitle ?? 'items'}'.toUpperCase(),
              iconInfo: BaseUiKitButtonIconData(
                iconData: ShuffleUiKitIcons.chevrondown,
              ),
              onPressed: () => setState(() => expanded = true),
            ),
          ),
        ],
        if (widget.items.length <= 4 || expanded)
          ...widget.items.map(
            (e) => e.paddingOnly(bottom: EdgeInsetsFoundation.vertical16),
          ),
      ],
    );
  }
}
