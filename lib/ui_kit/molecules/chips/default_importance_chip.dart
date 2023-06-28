import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DefaultImportanceChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const DefaultImportanceChip({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: ColorsFoundation.surface2,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 104,
          width: 104,
          decoration: const BoxDecoration(
            color: ColorsFoundation.surface2,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: AutoSizeText(
              text,
              style: context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                color: ColorsFoundation.darkNeutral900,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
              wrapWords: false,
              minFontSize: 9,
              maxLines: 3,
            ).paddingAll(EdgeInsetsFoundation.all2)
          ),
        ),
      ),
    );
  }
}
