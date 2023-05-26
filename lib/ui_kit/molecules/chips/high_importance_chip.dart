import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class HighImportanceChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const HighImportanceChip({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 120,
          width: 120,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: GradientFoundation.defaultRadialGradient,
          ),
          child: Center(
            child: Text(
              text,
              style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ).paddingAll(EdgeInsetsFoundation.all16),
          ),
        ),
      ),
    );
  }
}
