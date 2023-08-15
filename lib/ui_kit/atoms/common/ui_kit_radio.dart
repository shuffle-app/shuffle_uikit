import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRadio extends StatelessWidget {
  final bool selected;

  const UiKitRadio({
    super.key,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 125),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: selected
          ? ImageWidget(
              key: UniqueKey(),
              svgAsset: GraphicsFoundation.instance.svg.filledRadio,
            )
          : ImageWidget(
              key: UniqueKey(),
              svgAsset: GraphicsFoundation.instance.svg.emptyRadio,
            ),
    );

    if (selected) {
      return ImageWidget(
        svgAsset: GraphicsFoundation.instance.svg.filledRadio,
      );
    }

    return ImageWidget(
      svgAsset: GraphicsFoundation.instance.svg.emptyRadio,
    );
  }
}
