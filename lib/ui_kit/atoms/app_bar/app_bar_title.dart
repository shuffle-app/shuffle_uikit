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
    return Expanded(
      child: Text(
        title,
        style: Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.titleLarge.copyWith(color: Colors.white),
        textAlign: centerTitle ? TextAlign.center : TextAlign.left,
      ),
    );
  }
}
