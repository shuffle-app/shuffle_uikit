import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuffle_uikit/foundation/ui_kit_colors.dart';

class AppBarCustomBackButton extends StatelessWidget {
  const AppBarCustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: UiKitColors.surface,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Ink(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: UiKitColors.surface,
          ),
          width: 28,
          height: 28,
          child: SvgPicture.asset(
            'assets/images/svg/chevron_left.svg',
            fit: BoxFit.scaleDown,
            package: 'shuffle_uikit',
          ),
        ),
      ),
    );
  }
}
