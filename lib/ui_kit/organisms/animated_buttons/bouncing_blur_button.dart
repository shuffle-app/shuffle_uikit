import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BouncingBlurButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget icon;

  const BouncingBlurButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingIconButtonAnimation(
      icon: icon,
      onPressed: onPressed,
      iconPadding: EdgeInsetsFoundation.all16,
    );
  }
}
