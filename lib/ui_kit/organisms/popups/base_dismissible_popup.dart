import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseDismissiblePopup extends StatelessWidget {
  final List<Widget> children;

  const BaseDismissiblePopup({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: ImageWidget(
          iconData: ShuffleUiKitIcons.cross,
          color: theme?.colorScheme.darkNeutral900,
          height: 19.h,
          fit: BoxFit.fitHeight,
        ),
      ),
      SpacingFoundation.verticalSpace16,
      UiKitCardWrapper(
          padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
          color: Colors.white,
          child: Column(mainAxisSize: MainAxisSize.min, children: children))
    ]);
  }
}
