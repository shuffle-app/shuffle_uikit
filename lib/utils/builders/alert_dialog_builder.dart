import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<T?> showUiKitAlertDialog<T extends Object?>(BuildContext context, AlertDialogData data) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      final textTheme = context.uiKitTheme?.boldTextTheme;

      return AlertDialog(
        backgroundColor: data.customBackgroundColor ?? context.uiKitTheme?.cardTheme.color,
        clipBehavior: Clip.hardEdge,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all24,
        ),
        titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
        title: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 0.8.sw,
            ),
            child: data.title),
        titleTextStyle: textTheme?.caption2Bold,
        content: data.content,
        contentTextStyle: textTheme?.body,
        contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        actions: [
          if (data.additionalButton != null) data.additionalButton!,
          context.dialogButton(
            data: BaseUiKitButtonData(onPressed: data.onPop ?? () => context.pop(), text: data.defaultButtonText),
            small: true,
            dialogButtonType:
                data.additionalButton != null ? DialogButtonType.buttonWhite : DialogButtonType.buttonBlack,
          )
        ],
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      );
    },
  );
}

Future<T?> showUiKitFullScreenAlertDialog<T extends Object?>(BuildContext context,
    {Color? backgroundColor, required Function child, double? paddingAll}) {
  final textStyle = context.uiKitTheme?.boldTextTheme.title2;

  return showDialog(
    context: context,
    barrierColor: Colors.white.withOpacity(0.1),
    useSafeArea: false,
    builder: (_) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: EdgeInsetsFoundation.horizontal16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all40,
        ),
        backgroundColor: backgroundColor ?? context.uiKitTheme?.colorScheme.surface1,
        clipBehavior: Clip.hardEdge,
        child: (child(_, textStyle) as Widget).paddingAll(paddingAll ?? EdgeInsetsFoundation.all24),
      ),
    ),
  );
}

//ignore: prefer-match-file-name
class AlertDialogData {
  final VoidCallback? onPop;
  final Widget? title;
  final Widget? content;
  final Widget? additionalButton;
  final String defaultButtonText;
  final Color? customBackgroundColor;

  AlertDialogData(
      {this.onPop,
      this.customBackgroundColor,
      this.title,
      this.content,
      this.additionalButton,
      required this.defaultButtonText});
}
