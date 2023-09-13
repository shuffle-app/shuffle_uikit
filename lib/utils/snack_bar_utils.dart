import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SnackBarUtils {
  SnackBarUtils._();

  static void show(
      {required String message,
      Duration? duration,
      required BuildContext context,
      VoidCallback? onTap}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all12
        ),
        backgroundColor: ColorsFoundation.darkNeutral900,
        duration: duration ?? const Duration(seconds: 3),
        content: Text(message),
        action: SnackBarAction(
          textColor: const Color(0xFFFAF2FB),
          label: 'OK',
          onPressed: onTap ??
              () {
                log('SnackBar action was pressed');
              },
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void hideAndShow(
      {required String message, required BuildContext context}) {
    hide(context);
    show(message: message, context: context);
  }
}
//
// class AppSnackBarAction {
//   AppSnackBarAction(this.text, {this.withDismiss = true, this.onTap});
//
//   final VoidCallback? onTap;
//   final String text;
//   final bool withDismiss;
// }
