import 'package:example/presentation/ui/widget_view/single_widget_view_page.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

import '../../../generated/test_widget_mapper.dart';
import '../../../generated/ui_kit/atoms/buttons/gradient_button_with_text_and_icon.dart';
import '../../../generated/ui_kit/organisms/place/slider_place_card.dart';

class ActionsMenu extends StatelessWidget {
  const ActionsMenu({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_horiz,
        color: Colors.white,
      ),
      color: Colors.black87,
      itemBuilder: (ctx) => [
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              context.push(SingleWidgetViewPage(
                widget: widget,
              ));
            },
            child: const Text(
              'Open widget in new page',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {
              print(TestWidgetMapper.getTestObject(widget).runtimeType);
              Navigator.of(context).pop();
              context.push(
                SingleWidgetViewPage(
                  widget: TestWidgetMapper.getTestObject(widget),
                ),
              );
            },
            child: const Text(
              'Inspect widget by elements',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
