import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/utils/widgets_factory/widgets_factory.dart';

enum DialogButtonType { buttonWhite, buttonBlack }

extension Factory on BuildContext {
  Widget button({
    String? text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    bool? gradient,
    bool? isTextButton,
    bool? small,
    bool? dialogButton,
    DialogButtonType? dialogButtonType,
    bool? onlyIcon,
    bool? outlined,
    bool? blurred,
  }) {
    if (small ?? false) {
      return WidgetsFactory.of(this)!
          .createSmallButton(
            text: text ?? '',
            onPressed: onPressed,
            icon: icon,
            color: color,
            gradient: gradient ?? false,
            isTextButton: isTextButton ?? true,
            dialogButton: dialogButton,
            dialogButtonType: dialogButtonType,
            onlyIcon: onlyIcon,
            outlined: outlined,
            blurred: blurred,
          )
          .build(this);
    } else {
      return WidgetsFactory.of(this)!
          .createOrdinaryButton(
            text: text ?? '',
            onPressed: onPressed,
            icon: icon,
            color: color,
            gradient: gradient ?? false,
            isTextButton: isTextButton ?? true,
            dialogButton: dialogButton,
            dialogButtonType: dialogButtonType,
            onlyIcon: onlyIcon,
            outlined: outlined,
            blurred: blurred,
          )
          .build(this);
    }
  }
}
