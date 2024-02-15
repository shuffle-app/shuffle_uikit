import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitIconHintCard extends StatelessWidget {
  final Widget icon;
  final String hint;

  const UiKitIconHintCard({
    Key? key,
    required this.icon,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hintStyle = context.uiKitTheme?.boldTextTheme.body;

    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          Text(
            hint,
            style: hintStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingSymmetric(
        vertical: EdgeInsetsFoundation.vertical12,
        horizontal: EdgeInsetsFoundation.horizontal8,
      ),
    );
  }
}
