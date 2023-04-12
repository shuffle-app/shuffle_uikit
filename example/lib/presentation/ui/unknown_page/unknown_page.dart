import 'package:flutter/material.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Page Not Found',
          style: Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.titleLarge,
        ),
      ),
    );
  }
}
