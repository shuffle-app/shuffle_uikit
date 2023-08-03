import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledActionCard extends StatelessWidget {
  final String title;
  final Widget actionButton;

  const UiKitTitledActionCard({
    super.key,
    required this.title,
    required this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: textTheme?.subHeadline,
          ),
          SpacingFoundation.verticalSpace16,
          actionButton,
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
