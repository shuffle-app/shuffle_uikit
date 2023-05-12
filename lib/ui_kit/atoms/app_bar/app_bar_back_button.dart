import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = context.uiKitTheme?.customAppBapTheme.iconTheme?.color;

    return Material(
      shape: const CircleBorder(),
      color: iconColor ?? ColorsFoundation.surface,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          if (context.canPop()) Navigator.pop(context);
        },
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconColor ?? ColorsFoundation.surface,
          ),
          width: 28.w,
          height: 28.h,
          child: ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.chevronLeft,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
