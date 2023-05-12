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
              const SlidingChip().paddingOnly(top: SpacingFoundation.verticalSpacing12, bottom: SpacingFoundation.verticalSpacing4),
              Expanded(
                child: Container(
                  decoration: ShapeDecoration(
                    shape: shape ?? const RoundedRectangleBorder(),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: child,
                  ),
                ),
              ),
              if (bottomBar != null) bottomBar
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
          filter: ImageFilter.blur(sigmaX: 2 * animation1.value, sigmaY: 2 * animation2.value),
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

void _empty() {}
