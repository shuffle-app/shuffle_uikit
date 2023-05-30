import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showUiKitGeneralFullScreenDialog(
  BuildContext context, {
  required Widget child,
  Widget? bottomBar,
  double? topPadding,
  Function onDismissed = _empty,
}) {
  final bottomSheetTheme = context.uiKitTheme?.bottomSheetTheme;
  final shape = bottomSheetTheme?.shape;
  dismissable(c) => Dismissible(
        key: Key(DateTime.now().toString()),
        direction: DismissDirection.down,
        onDismissed: (DismissDirection direction) {
          // Чтобы закрыть сам диалог (убрать серый фон)

          if (onDismissed != _empty) {
            Future.delayed(
              const Duration(milliseconds: 200),
              () => onDismissed(),
            );
          }

          Navigator.of(c, rootNavigator: true).pop();
        },
        // Отступ, чтобы не залезал на статусбар
        child: Dialog(
          clipBehavior: Clip.hardEdge,
          insetPadding: EdgeInsets.zero,
          backgroundColor: bottomSheetTheme?.backgroundColor,
          shape: shape,
          child: Column(
            children: [
              const SlidingChip().paddingOnly(
                  top: SpacingFoundation.verticalSpacing12,
                  bottom: SpacingFoundation.verticalSpacing4),
              Expanded(
                  child: Stack(fit: StackFit.expand, children: [
                Container(
                    decoration: ShapeDecoration(
                      shape: shape ?? const RoundedRectangleBorder(),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: SingleChildScrollView(
                      primary: true,
                      physics: const ClampingScrollPhysics(),
                      child: Column(children: [
                        child,
                        if (bottomBar != null)
                          Opacity(opacity: 0, child: bottomBar)
                      ]),
                    )),
                if (bottomBar != null)
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                          decoration: const BoxDecoration(
                              gradient: GradientFoundation
                                  .solidSurfaceLinearGradient),
                          child: bottomBar))
              ])),
            ],
          ),
        ).paddingOnly(top: topPadding ?? 30.h),
      );

  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black38,
    context: context,
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (context, animation1, animation2, child) {
      return BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: animation1.value * 2,
              sigmaY: animation2.value * 2,
              tileMode: TileMode.decal),
          child: Animations.slideAnimation(animation1, animation2, child));
    },
    pageBuilder: (
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
    ) {
      return dismissable(context);
    },
  );
}

//ignore: no-empty-block
void _empty() {}
