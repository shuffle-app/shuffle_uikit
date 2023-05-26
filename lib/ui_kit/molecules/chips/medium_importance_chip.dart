import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MediumImportanceChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const MediumImportanceChip({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 104,
          width: 104,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              text,
              style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(
                color: Colors.black,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ).paddingAll(EdgeInsetsFoundation.all16),
          ),
        ),
      ),
    );
  }
}
