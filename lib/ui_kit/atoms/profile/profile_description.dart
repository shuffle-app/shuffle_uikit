import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfileDescription extends StatelessWidget {
  final String text;

  const ProfileDescription({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.caption1,
    );
  }
}
