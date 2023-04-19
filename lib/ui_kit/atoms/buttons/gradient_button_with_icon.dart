import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final String text;
  final Widget icon;

  const GradientButtonWithIcon({
    Key? key,
    this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        gradient: GradientFoundation.buttonGradient,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: context.uiKitTheme?.boldTextTheme.bodyUpperCase.copyWith(color: Colors.black),
          ),
          SpacingFoundation.horizontalSpace8,
          icon,
        ],
      ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical12),
    );
  }
}
