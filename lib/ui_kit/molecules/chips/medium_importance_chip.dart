import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
            child: AutoSizeText(
              text,
              style: context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              minFontSize: 9,
              wrapWords: false,
              softWrap: true,
              maxLines: 3,
            ).paddingAll(EdgeInsetsFoundation.all2)
          ),
        ),
      ),
    );
  }
}
