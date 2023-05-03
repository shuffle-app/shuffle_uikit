import 'package:flutter/material.dart';
import 'package:shuffle_uikit/utils/extentions/context_theme_extension.dart';

class PlacePostBody extends StatelessWidget {
  final String text;

  const PlacePostBody({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final textStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;
        return Text(
          text,
          style: textStyle,
        );
      },
    );
  }
}
