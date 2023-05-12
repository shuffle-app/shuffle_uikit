import 'package:flutter/material.dart';
import 'package:shuffle_uikit/utils/extentions/ui_kit_theme_extention.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Page Not Found',
          style: context.uiKitTheme?.boldTextTheme.titleLarge,
        ),
      ),
    );
  }
}
