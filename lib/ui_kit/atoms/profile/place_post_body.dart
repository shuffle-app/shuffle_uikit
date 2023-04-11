import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
        final textStyle = Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.caption1;
        return Text(
          text,
          style: textStyle,
        );
      },
    );
  }
}
