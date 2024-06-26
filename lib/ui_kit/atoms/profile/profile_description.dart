import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfileDescription extends StatelessWidget {
  final String text;

  const ProfileDescription({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.uiKitTheme?.boldTextTheme.caption1Bold,
    );
  }
}
