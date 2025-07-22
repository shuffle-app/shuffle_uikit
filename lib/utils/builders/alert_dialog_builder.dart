import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<T?> showUiKitAlertDialog<T extends Object?>(
  BuildContext context,
  AlertDialogData data, {
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      final theme = context.uiKitTheme;
      final textTheme = theme?.boldTextTheme;

      return AlertDialog(
        backgroundColor: data.customBackgroundColor ?? theme?.cardTheme.color ?? theme?.colorScheme.inversePrimary,
        clipBehavior: Clip.hardEdge,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        insetPadding: data.insetPadding ?? EdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all24,
        ),
        titlePadding: data.titlePadding ?? const EdgeInsets.fromLTRB(24, 24, 24, 8),
        title: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 0.8.sw,
            ),
            child: data.title),
        titleTextStyle: textTheme?.caption2Bold,
        content: data.content,
        contentTextStyle: textTheme?.body,
        contentPadding: data.contentPadding ?? const EdgeInsets.fromLTRB(24, 8, 24, 8),
        actions: data.actions ??
            [
              if (data.actionsAlignment == Axis.vertical) ...[
                if (data.additionalButton != null) SizedBox(width: 0.8.sw, child: data.additionalButton!),
                if (data.defaultButtonText.isNotEmpty)
                  SizedBox(
                      width: 0.8.sw,
                      child: context.dialogButton(
                        data: BaseUiKitButtonData(
                          onPressed: data.onPop ?? () => context.pop(),
                          text: data.defaultButtonText,
                        ),
                        small: data.defaultButtonSmall ?? true,
                        isOutlined: data.defaultButtonOutlined,
                        dialogButtonType:
                            data.additionalButton != null ? DialogButtonType.buttonWhite : DialogButtonType.buttonBlack,
                      )).paddingOnly(top: SpacingFoundation.verticalSpacing4)
              ] else ...[
                if (data.additionalButton != null) data.additionalButton!,
                if (data.defaultButtonText.isNotEmpty)
      SizedBox(
      width: data.additionalButton != null ? null : 0.8.sw,
      child:context.dialogButton(
                    data: BaseUiKitButtonData(
                      onPressed: data.onPop ?? () => context.pop(),
                      text: data.defaultButtonText,
                    ),
                    small: data.defaultButtonSmall ?? true,
                    isOutlined: data.defaultButtonOutlined,
                    dialogButtonType:
                        data.additionalButton != null ? DialogButtonType.buttonWhite : DialogButtonType.buttonBlack,
                  ))
              ]
            ],
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: data.actionsPadding ?? const EdgeInsets.fromLTRB(24, 8, 24, 24),
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
    builder: (ctx) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: EdgeInsetsFoundation.horizontal16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all40,
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        clipBehavior: Clip.hardEdge,
        child: (child(ctx, textStyle) as Widget).paddingAll(paddingAll ?? EdgeInsetsFoundation.all24),
      ),
    ),
  );
}

//ignore: prefer-match-file-name
class AlertDialogData {
  final EdgeInsets? insetPadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? titlePadding;
  final EdgeInsets? actionsPadding;
  final Axis? actionsAlignment;
  final VoidCallback? onPop;
  final Widget? title;
  final Widget? content;
  final Widget? additionalButton;
  final String defaultButtonText;
  final bool? defaultButtonSmall;
  final bool? defaultButtonOutlined;

  final List<Widget>? actions;
  final Color? customBackgroundColor;

  const AlertDialogData({
    required this.defaultButtonText,
    this.onPop,
    this.customBackgroundColor,
    this.title,
    this.content,
    this.additionalButton,
    this.defaultButtonSmall,
    this.defaultButtonOutlined,
    this.actions,
    this.actionsAlignment,
    this.insetPadding,
    this.contentPadding,
    this.titlePadding,
    this.actionsPadding,
  });
}
