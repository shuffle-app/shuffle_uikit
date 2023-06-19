import 'package:example/presentation/ui/widget_view/actions_menu.dart';
import 'package:flutter/material.dart';

class MenuWrap extends StatelessWidget {
  const MenuWrap({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // to ignore spacings
    if (child.runtimeType == SizedBox) {
      return child;
    }

    return Column(
      children: [
        ActionsMenu(
          widget: child,
        ),
        child,
      ],
    );
  }
}
