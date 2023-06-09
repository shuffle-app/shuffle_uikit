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

    return LayoutBuilder(
      builder: (context, size) {
        return UiKitCardWrapper(
          width: size.maxWidth / 2 - 16.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SpacingFoundation.verticalSpace8,
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
      },
    );
  }
}
