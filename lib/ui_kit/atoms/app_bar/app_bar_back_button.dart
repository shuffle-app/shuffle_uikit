import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FlatCircleButton(
      onTap: () {
        Navigator.pop(context);
      },
      iconData: ShuffleUiKitIcons.chevronleft,
    );
  }
}
