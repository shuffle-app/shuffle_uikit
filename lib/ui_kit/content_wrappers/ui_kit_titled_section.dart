import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledSection extends StatelessWidget {
  final String title;
  final Widget child;

  const UiKitTitledSection({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: context.uiKitTheme?.boldTextTheme.labelLarge,
          ).paddingOnly(
            top: EdgeInsetsFoundation.vertical16,
            left: EdgeInsetsFoundation.horizontal16,
          ),
          SpacingFoundation.verticalSpace12,
          child,
        ],
      ),
    );
  }
}
