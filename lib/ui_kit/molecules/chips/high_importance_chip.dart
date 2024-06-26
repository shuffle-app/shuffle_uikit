import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class HighImportanceChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const HighImportanceChip({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            gradient: GradientFoundation.attentionCard,
            border: Border.fromBorderSide(
              BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: AutoSizeText(
              text,
              style: context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                color: Colors.black,
              ),
              minFontSize: 9,
              textAlign: TextAlign.center,
              softWrap: true,
              wrapWords: false,
              maxLines: 3,
            ).paddingAll(EdgeInsetsFoundation.all2),
          ),
        ),
      ),
    );
  }
}
