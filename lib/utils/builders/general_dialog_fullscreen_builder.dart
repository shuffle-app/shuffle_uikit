import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showUiKitGeneralFullScreenDialog(BuildContext context, GeneralDialogData data) {
  // final Key key=Key(DateTime.now().toString());

  // return Navigator.push(
  //   context,
  //   PageRouteBuilder(
  //     opaque: false,
  //     barrierDismissible: true,
  //     barrierLabel: '',
  //     maintainState: false,
  //     fullscreenDialog: true,
  //     barrierColor: const Color(0xff2A2A2A),
  //     transitionDuration: const Duration(milliseconds: 250),
  //     transitionsBuilder: (context, animation1, animation2, child) {
  //       return SlideTransition(
  //         position: Tween<Offset>(
  //           end: Offset.zero,
  //           begin: const Offset(0.0, 1.0),
  //         ).animate(animation1),
  //         child: child,
  //       );
  //     },
  //     pageBuilder: (
  //       BuildContext context,
  //       Animation<double> animation1,
  //       Animation<double> animation2,
  //     ) {
  //       return UiKitBottomModalSheet(
  //         data: data,
  //       );
  //     },
  //   ),
  // );

  return showModalBottomSheet(
    barrierLabel: '',
    useRootNavigator: data.useRootNavigator,
    barrierColor: const Color(0xff2A2A2A),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(
      maxHeight: 0.95.sh - (data.topPadding ?? 0),
      minWidth: 1.sw,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusFoundation.onlyTop24,
    ),
    clipBehavior: Clip.hardEdge,
    isDismissible: true,
    context: context,
    builder: (context) {
      return UiKitBottomModalSheet(
        data: data,
      );
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
      {this.useRootNavigator = true, required this.child, this.bottomBar, this.topPadding, this.onDismissed = _empty});
}
