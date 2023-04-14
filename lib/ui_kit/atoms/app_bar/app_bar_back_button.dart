import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/tokens/assets.gen.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final iconColor = Theme.of(context).extension<UiKitThemeData>()?.customAppBapTheme.iconTheme?.color;
        return Material(
          shape: const CircleBorder(),
          color: iconColor ?? ColorsFoundation.surface,
          elevation: 0,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Ink(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor ?? ColorsFoundation.surface,
              ),
              //TODO: подумать как избавиться от захардкоженных размеров
              width: 28,
              height: 28,
              child: GraphicsFoundation.instance.svgPicture(
                asset: Assets.images.svg.chevronLeft,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        );
      },
    );
  }
}
