import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final bool centerTitle;

  const AppBarTitle({
    Key? key,
    required this.title,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        TextStyle? textStyle =
            Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.title1 ?? Theme.of(context).primaryTextTheme.titleMedium;
        textStyle = textStyle?.copyWith(color: Colors.white);
        return Expanded(
          child: Text(
            title,
            style: textStyle,
            textAlign: centerTitle ? TextAlign.center : TextAlign.left,
          ),
        );
      },
    );
  }
}
