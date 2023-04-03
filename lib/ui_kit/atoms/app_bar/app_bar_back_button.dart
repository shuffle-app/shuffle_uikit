import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';
import 'package:shuffle_uikit/tokens/assets.gen.dart';

class AppBarCustomBackButton extends StatelessWidget {
  const AppBarCustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: ColorsFoundation.surface,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Ink(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsFoundation.surface,
          ),
          width: 28,
          height: 28,
          child: GraphicsFoundation.instance.svgPicture(
            asset: Assets.images.svg.chevronLeft,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
