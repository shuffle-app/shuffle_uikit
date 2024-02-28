import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageWithActionsSheet extends StatelessWidget {
  final Widget title;
  final String message;
  final VoidCallback? onAgree;
  final VoidCallback? onDismiss;

  const UiKitMessageWithActionsSheet({
    Key? key,
    required this.title,
    required this.message,
    this.onAgree,
    this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final coloScheme = theme?.colorScheme;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all32,
        boxShadow: [
          BoxShadow(
            color: coloScheme?.surface ?? Colors.transparent,
            offset: const Offset(0, 0),
            blurRadius: 400,
            spreadRadius: 200,
          ),
        ],
      ),
      child: UiKitCardWrapper(
        borderRadius: BorderRadiusFoundation.all32,
        color: coloScheme?.surface1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            title,
            SpacingFoundation.verticalSpace12,
            Text(
              message,
              style: boldTextTheme?.caption1Medium,
            ),
            SpacingFoundation.verticalSpace24,
            context.gradientButton(
              data: BaseUiKitButtonData(
                text: S.current.Update,
                onPressed: onAgree,
              ),
            ),
            SpacingFoundation.verticalSpace12,
            context.outlinedButton(
              data: BaseUiKitButtonData(
                text: S.current.Cancel,
                onPressed: onDismiss,
              ),
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all16),
      ),
    );
  }
}
