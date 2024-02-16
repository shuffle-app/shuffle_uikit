import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHintDialog extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final List<UiKitIconHintCard> hintTiles;
  final String subtitle;
  final String dismissText;
  final VoidCallback onDismiss;

  const UiKitHintDialog({
    Key? key,
    required this.title,
    required this.textStyle,
    required this.hintTiles,
    required this.subtitle,
    required this.dismissText,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        SpacingFoundation.verticalSpace8,
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 112 / 146,
          crossAxisCount: 2,
          children: hintTiles,
        ),
        SpacingFoundation.verticalSpace8,
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
        SpacingFoundation.verticalSpace8,
        context.button(
          data: BaseUiKitButtonData(
            text: dismissText,
            onPressed: onDismiss,
            fit: ButtonFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
