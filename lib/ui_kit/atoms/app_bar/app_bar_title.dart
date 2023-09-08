import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final bool? centerTitle;

  const AppBarTitle({
    Key? key,
    required this.title,
    this.centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.title1 ?? Theme.of(context).primaryTextTheme.titleMedium;
    textStyle = textStyle?.copyWith(color: context.uiKitTheme?.colorScheme.inversePrimary);

    return Expanded(
      child: Text(
        title,
        style: textStyle,
        textAlign: centerTitle ?? Platform.isIOS ? TextAlign.center : TextAlign.left,
      ),
    );
  }
}
