import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showUiKitGeneralFullScreenDialog(BuildContext context, GeneralDialogData data) {
  final Key key=UniqueKey();
  // final Key key=Key(DateTime.now().toString());
  dismissable(animation) =>
      UiKitBottomModalSheet(data: data, startAnimation: animation,dissmissKey: key,);


  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    useRootNavigator: data.useRootNavigator,
    barrierColor: Colors.white.withOpacity(0.07),
    context: context,
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
    ) {
      log('here is pageBuilder',name:'showUiKitGeneralFullScreenDialog');
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
