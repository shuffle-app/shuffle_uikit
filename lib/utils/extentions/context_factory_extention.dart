import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/utils/widgets_factory/widgets_factory.dart';

enum DialogButtonType { buttonWhite, buttonBlack }

extension Factory on BuildContext {
  Widget button({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    bool? gradient,
    bool? isTextButton,
    bool? small,
    bool? dialogButton,
    DialogButtonType? dialogButtonType,
  }) {
    if (small ?? false) {
      return WidgetsFactory.of(this)!
          .createSmallButton(
            text: text,
            onPressed: onPressed,
            icon: icon,
            color: color,
            gradient: gradient ?? false,
            isTextButton: isTextButton ?? false,
            dialogButton: dialogButton,
            dialogButtonType: dialogButtonType,
          )
          .build(this);
    } else {
      return WidgetsFactory.of(this)!
          .createOrdinaryButton(
            text: text,
            onPressed: onPressed,
            icon: icon,
            color: color,
            gradient: gradient ?? false,
            isTextButton: isTextButton ?? false,
            dialogButton: dialogButton,
            dialogButtonType: dialogButtonType,
          )
          .build(this);
    }
  }
}
