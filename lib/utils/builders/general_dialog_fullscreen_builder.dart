import 'package:flutter/material.dart';
import 'package:flutter_html_iframe/shims/dart_ui_real.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showUiKitGeneralFullScreenDialog(BuildContext context, GeneralDialogData data) {
  final Key key = UniqueKey();
  // final Key key=Key(DateTime.now().toString());

  return Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      barrierLabel: '',
      maintainState: true,
      fullscreenDialog: true,
      barrierColor: Colors.white.withOpacity(0.07),
      transitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            end: Offset.zero,
            begin: const Offset(0.0, 1.0),
          ).animate(animation1),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 50,
              sigmaY: 50,
            ),
            child: child,
          ),
        );
      },
      pageBuilder: (
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
      ) {
        return UiKitBottomModalSheet(
          data: data,
          startAnimation: animation1,
          dissmissKey: key,
        );
      },
    ),
  );

  // return showModalBottomSheet(
  //   barrierLabel: '',
  //   useRootNavigator: data.useRootNavigator,
  //   barrierColor: Colors.white.withOpacity(0.07),
  //   isScrollControlled: true,
  //   constraints: BoxConstraints(
  //     minHeight: 1.sh,
  //     minWidth: 1.sw,
  //   ),
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadiusFoundation.onlyTop24,
  //   ),
  //   clipBehavior: Clip.hardEdge,
  //   isDismissible: true,
  //   context: context,
  //   builder: (context) {
  //     return BackdropFilter(
  //       filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
  //       child: UiKitBottomModalSheet(
  //         data: data,
  //         startAnimation: const AlwaysStoppedAnimation(1.0),
  //         dissmissKey: key,
  //       ),
  //     );
  //   },
  // );

  // return showGeneralDialog(
  //   barrierDismissible: true,
  //   barrierLabel: '',
  //   useRootNavigator: data.useRootNavigator,
  //   barrierColor: Colors.white.withOpacity(0.07),
  //   context: context,
  //   transitionDuration: const Duration(milliseconds: 250),
  //   transitionBuilder: (context, animation1, animation2, child) {
  //     return BackdropFilter(
  //       filter: ImageFilter.blur(
  //         sigmaX: animation1.value * 50,
  //         sigmaY: animation1.value * 50,
  //       ),
  //       child: SlideTransition(
  //         position: Tween<Offset>(
  //           end: Offset.zero,
  //           begin: const Offset(0.0, 1.0),
  //         ).animate(animation1),
  //         child: child,
  //       ),
  //     );
  //   },
  //   pageBuilder: (
  //     BuildContext context,
  //     Animation<double> animation1,
  //     Animation<double> animation2,
  //   ) {
  //     return RepaintBoundary(
  //       child: UiKitBottomModalSheet(
  //         data: data,
  //         startAnimation: animation1,
  //         dissmissKey: key,
  //       ),
  //     );
  //   },
  // );
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
      {this.useRootNavigator = true, required this.child, this.bottomBar, this.topPadding, this.onDismissed = _empty});
}
