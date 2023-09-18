import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SnackBarUtils {
  SnackBarUtils._();

  static void show(
      {required String message,
      Duration? duration,
      required BuildContext context,
      AppSnackBarType type = AppSnackBarType.info,
      VoidCallback? onTap}) {
    final theme = context.uiKitTheme;
    final Color color = () {
      switch (type) {
        case AppSnackBarType.info:
          return UiKitColors.info;
        case AppSnackBarType.success:
          return UiKitColors.success;
        case AppSnackBarType.warning:
          return UiKitColors.warning;
        case AppSnackBarType.error:
          return UiKitColors.error;
        case AppSnackBarType.neutral:
          return UiKitColors.darkNeutral900;
      }
    }();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 6.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all12),
        backgroundColor: Color.alphaBlend(color.withOpacity(0.16), UiKitColors.surface),
        duration: duration ?? const Duration(seconds: 3),
        content: AutoSizeText(
          message,
          style: theme?.regularTextTheme.labelSmall.copyWith(color: color),
        ),
        closeIconColor: color,
        showCloseIcon: onTap == null,
        action: onTap == null ? null : SnackBarAction(textColor: color, label: 'X', onPressed: onTap),
      ),
    );
  }

  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void hideAndShow({required String message, required BuildContext context}) {
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

enum AppSnackBarType {
  info,
  success,
  warning,
  error,
  neutral,
}
