import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MediumImportanceChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const MediumImportanceChip({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: colorScheme?.inverseSurface,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 120,
          width: 120,
          child: Center(
            child: AutoSizeText(
              text,
              style: context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                color: colorScheme?.surface,
              ),
              textAlign: TextAlign.center,
              minFontSize: 9,
              wrapWords: false,
              softWrap: true,
              maxLines: 3,
            ).paddingAll(EdgeInsetsFoundation.all2),
          ),
        ),
      ),
    );
  }
}
