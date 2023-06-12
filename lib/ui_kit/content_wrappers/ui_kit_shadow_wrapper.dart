import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitShadowWrapper extends StatelessWidget {
  final BorderRadius borderRadius;
  final Widget child;

  const UiKitShadowWrapper({
    super.key,
    required this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: const [
          BoxShadow(
            color: ColorsFoundation.shadowPink,
            blurRadius: 18,
            spreadRadius: 0,
            offset: Offset.zero,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: child,
    );
  }
}
