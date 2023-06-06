import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showUiKitGeneralFullScreenDialog(BuildContext context, GeneralDialogData data) {
  final bottomSheetTheme = context.uiKitTheme?.bottomSheetTheme;
  final shape = bottomSheetTheme?.shape;
  dismissable(c) => Dismissible(
        key: Key(DateTime.now().toString()),
        direction: DismissDirection.down,
        onDismissed: (DismissDirection direction) {
          // Чтобы закрыть сам диалог (убрать серый фон)

          if (data.onDismissed != _empty) {
            Future.delayed(
              const Duration(milliseconds: 200),
              () => data.onDismissed(),
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
                        data.child,
                        if (data.bottomBar != null)
                          Opacity(opacity: 0, child: data.bottomBar)
                      ]),
                    )),
                if (data.bottomBar != null)
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                          decoration: const BoxDecoration(
                              gradient: GradientFoundation
                                  .solidSurfaceLinearGradient),
                          child: data.bottomBar))
              ])),
            ],
          ),
        ).paddingOnly(top: data.topPadding ?? 30.h),
      );

  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    useRootNavigator: data.useRootNavigator,
    barrierColor: ColorsFoundation.darkNeutral900.withOpacity(0.5),
    context: context,
    transitionDuration: const Duration(milliseconds: 350),
    transitionBuilder: (context, animation1, animation2, child) {

      return BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: animation1.value * 2,
              sigmaY: animation1.value * 2,
              // tileMode: TileMode.decal
          ),
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

//ignore: prefer-match-file-name
class GeneralDialogData {
  final bool useRootNavigator;
  final Widget child;

  final Widget? bottomBar;
  final double? topPadding;

  final Function onDismissed;

  GeneralDialogData(
      {this.useRootNavigator = true,
      required this.child,
      this.bottomBar,
      this.topPadding,
      this.onDismissed = _empty});
}
