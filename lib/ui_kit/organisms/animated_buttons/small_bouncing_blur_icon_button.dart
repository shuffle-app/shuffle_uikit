import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallBouncingBlurIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget icon;

  const SmallBouncingBlurIconButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingIconButtonAnimation(
      onPressed: onPressed,
      icon: icon,
      iconPadding: EdgeInsetsFoundation.all12,
    );
  }
}
