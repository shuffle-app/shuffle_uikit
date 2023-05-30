import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSignWithCaption extends StatelessWidget {
  final String caption;
  final ImageWidget sign;

  const UiKitSignWithCaption({
    Key? key,
    required this.caption,
    required this.sign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      color: ColorsFoundation.surface2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          sign,
          SpacingFoundation.verticalSpace12,
          Text(
            caption,
            style: context.uiKitTheme?.boldTextTheme.caption1Bold,
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all12),
    );
  }
}

class UiKitSignWithCaptionModel {
  final String caption;
  final ImageWidget sign;

  UiKitSignWithCaptionModel({
    required this.caption,
    required this.sign,
  });
}
