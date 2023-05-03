import 'package:flutter/material.dart';
import 'package:shuffle_uikit/utils/extentions/context_theme_extension.dart';

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
      style: context.uiKitTheme?.boldTextTheme.caption1Bold,
    );
  }
}
