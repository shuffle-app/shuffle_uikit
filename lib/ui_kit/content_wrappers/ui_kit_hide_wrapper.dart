import 'package:flutter/material.dart';

class UiKitHideWrapper extends StatelessWidget {
  final bool shouldHide;
  final Widget child;

  const UiKitHideWrapper({
    Key? key,
    required this.shouldHide,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shouldHide) return const SizedBox.shrink();

    return child;
  }
}
