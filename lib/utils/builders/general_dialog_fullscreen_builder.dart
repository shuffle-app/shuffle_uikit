import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showUiKitGeneralFullScreenDialog(BuildContext context, GeneralDialogData data) {
  final Key key = UniqueKey();
  // final Key key=Key(DateTime.now().toString());

  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    useRootNavigator: data.useRootNavigator,
    barrierColor: Colors.white.withOpacity(0.07),
    context: context,
    transitionDuration: const Duration(milliseconds: 250),
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween<Offset>(
          end: Offset.zero,
          begin: const Offset(0.0, 1.0),
        ).animate(animation1),
        child: child,
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
