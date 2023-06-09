import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showUiKitGeneralFullScreenDialog(BuildContext context, GeneralDialogData data) {
  final bottomSheetTheme = context.uiKitTheme?.bottomSheetTheme;
  final shape = bottomSheetTheme?.shape;
  dismissable( animation) => UiKitBottomModalSheet(data: data,startAnimation:animation);
      // FadeTransition(
      // opacity: animation,
      // child: BackdropFilter(
      //     filter: ImageFilter.blur(
      //       sigmaX: 50,
      //       // sigmaX: animation1.value * 50,
      //       sigmaY: 50,
      //       // tileMode: TileMode.decal
      //     ),
      //     child: SlideTransition(
      //         position: Tween<Offset>(
      //           end: Offset.zero,
      //           begin: const Offset(0.0, 1.0),
      //         ).animate(animation),
      //         child: Dismissible(
      //           key: Key(DateTime.now().toString()),
      //           direction: DismissDirection.down,
      //           onDismissed: (DismissDirection direction) {
      //             // Чтобы закрыть сам диалог (убрать серый фон)
      //
      //             if (data.onDismissed != _empty) {
      //               Future.delayed(
      //                 const Duration(milliseconds: 200),
      //                 () => data.onDismissed(),
      //               );
      //             }
      //
      //             Navigator.of(c, rootNavigator: data.useRootNavigator).pop();
      //           },
      //           // Отступ, чтобы не залезал на статусбар
      //           child: Dialog(
      //             clipBehavior: Clip.hardEdge,
      //             insetPadding: EdgeInsets.zero,
      //             backgroundColor: bottomSheetTheme?.backgroundColor,
      //             shape: shape,
      //             child: Column(
      //               children: [
      //                 const SlidingChip().paddingOnly(
      //                     top: SpacingFoundation.verticalSpacing12,
      //                     bottom: SpacingFoundation.verticalSpacing4),
      //                 Expanded(
      //                     child: Stack(fit: StackFit.expand, children: [
      //                   Container(
      //                       decoration: ShapeDecoration(
      //                         shape: shape ?? const RoundedRectangleBorder(),
      //                       ),
      //                       clipBehavior: Clip.hardEdge,
      //                       child: SingleChildScrollView(
      //                         primary: true,
      //                         physics: const ClampingScrollPhysics(),
      //                         child: Column(children: [
      //                           data.child,
      //                           if (data.bottomBar != null)
      //                             Opacity(opacity: 0, child: data.bottomBar)
      //                         ]),
      //                       )),
      //                   if (data.bottomBar != null)
      //                     Positioned(
      //                         bottom: 0,
      //                         right: 0,
      //                         left: 0,
      //                         child: Container(
      //                             decoration: const BoxDecoration(
      //                                 gradient: GradientFoundation
      //                                     .solidSurfaceLinearGradient),
      //                             child: data.bottomBar))
      //                 ])),
      //               ],
      //             ),
      //           ).paddingOnly(
      //               top: data.topPadding ??
      //                   (MediaQuery.of(context).viewPadding.top)),
      //         ))));

  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    useRootNavigator: data.useRootNavigator,
    barrierColor: Colors.white.withOpacity(0.07),
    context: context,
    transitionDuration: const Duration(milliseconds: 250),
    // transitionBuilder: (context, animation1, animation2, child) {
    //   return BackdropFilter(
    //       filter: ImageFilter.blur(
    //         sigmaX: animation1.value * 50,
    //         sigmaY: animation1.value * 50,
    //         // tileMode: TileMode.decal
    //       ),
    //       child: child);
    //   // child: Animations.slideAnimation(animation1, animation2, child));
    // },
    pageBuilder: (
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
    ) {
      return dismissable(animation1);
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
