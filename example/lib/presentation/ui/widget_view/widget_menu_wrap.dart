import 'package:example/presentation/ui/widget_view/actions_menu.dart';
import 'package:flutter/material.dart';

class MenuWrap extends StatelessWidget {
  const MenuWrap({super.key, required this.child, this.prefix});

  final Widget child;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    if (child.runtimeType == MenuWrap || child.runtimeType == SizedBox) {
      return child;
    }
    return Column(
      children: [
        ActionsMenu(
          widget: child,
          prefix: prefix,
        ),
        child,
      ],
    );
  }
}
