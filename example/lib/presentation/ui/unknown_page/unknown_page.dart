import 'package:flutter/material.dart';
import 'package:shuffle_uikit/utils/extentions/context_theme_extension.dart';

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
