import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/utils/widgets_factory/widgets_factory.dart';

extension Factory on BuildContext {
  Widget button({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    double? height,
    bool? gradient,
  }) =>
      WidgetsFactory.of(this)!
          .createButton(
            text: text,
            onPressed: onPressed,
            icon: icon,
            color: color,
            height: height,
            gradient: gradient ?? false,
          )
          .build(this);
}
