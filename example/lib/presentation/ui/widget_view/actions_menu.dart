import 'package:example/presentation/ui/widget_view/single_widget_view_page.dart';
import 'package:example/presentation/ui/widget_view/testcases_page.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ActionsMenu extends StatelessWidget {
  const ActionsMenu(
      {super.key, required this.widget, this.prefix});

  final Widget widget;
  final String? prefix;

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
              context.pop();
              context.push(
                SingleWidgetViewPage(
                  widget: widget,
                ),
              );
            },
            child: const Text(
              'Open widget in new page',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        if (prefix != null)
          PopupMenuItem(
            child: GestureDetector(
              onTap: () {
                context.push(
                  TestCasesPage(
                    prefix: prefix!,
                  ),
                );
              },
              child: const Text(
                'Open Testcases',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
