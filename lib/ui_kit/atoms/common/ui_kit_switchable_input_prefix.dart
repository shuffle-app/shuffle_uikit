import 'package:flutter/material.dart';

class UiKitSwitchableInputPrefix extends StatelessWidget {
  final Widget primary;
  final Widget secondary;
  final ValueNotifier<bool> notifier;

  const UiKitSwitchableInputPrefix({
    super.key,
    required this.primary,
    required this.secondary,
    required this.notifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: notifier,
      builder: (context, value, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: value ? secondary : primary,
        );
      },
    );
  }
}
