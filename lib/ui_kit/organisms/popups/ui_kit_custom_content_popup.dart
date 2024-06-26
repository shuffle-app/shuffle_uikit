import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCustomContentPopup extends StatelessWidget {
  final String title;
  final String? contentSubtitle;
  final Widget content;
  final List<Widget> actions;

  const UiKitCustomContentPopup({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.contentSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
      ),
      insetPadding: EdgeInsets.all(EdgeInsetsFoundation.all24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: textTheme?.title2.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SpacingFoundation.verticalSpace8,
          content,
          SpacingFoundation.verticalSpace16,
          if (contentSubtitle != null) ...[
            Text(
              contentSubtitle!,
              style: textTheme?.caption3Medium.copyWith(color: colorScheme?.surface),
              textAlign: TextAlign.center,
            ),
            SpacingFoundation.verticalSpace16,
          ],
          Row(
            mainAxisSize: MainAxisSize.max,
            children: actions.map((e) => Expanded(child: e)).toList(),
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all24),
    );
  }
}
