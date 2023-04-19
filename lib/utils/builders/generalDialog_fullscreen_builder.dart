import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showUiKitGeneralFullScreenDialog(
  BuildContext context, {
  required Widget child,
  double? topPadding,
  Function onDismissed = _empty,
}) {
  final Widget dismissable = Dismissible(
    key: Key(DateTime.now().toString()),
    direction: DismissDirection.down,
    onDismissed: (DismissDirection direction) async {
      // Чтобы закрыть сам диалог (убрать серый фон)

      if (onDismissed != _empty) {
        await Future.delayed(
          const Duration(seconds: 1),
          () => onDismissed(),
        );
      }

      context.pop();
    },
    // Отступ, чтобы не залезал на статусбар
    child: Dialog(
        clipBehavior: Clip.hardEdge,
        insetPadding: EdgeInsets.zero,
        backgroundColor:
            context.uiKitTheme?.buttonTheme.colorScheme?.background,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.onlyTop24),
        child: Column(
          children: [
            const SlidingChip().paddingSymmetric(vertical: 12.h),
            Expanded(
                child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: EdgeInsetsFoundation.horizontal16),
              child: child,
            ))
          ],
        )).paddingOnly(top: topPadding ?? 50.h),
  );

  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black38,
    context: context,
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (context, animation1, animation2, child) {
      return BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 4 * animation1.value, sigmaY: 4 * animation2.value),
          child: Animations.slideAnimation(animation1, animation2, child));
    },
    pageBuilder: (
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
    ) {
      return dismissable;
    },
  );
}

void _empty() {}
