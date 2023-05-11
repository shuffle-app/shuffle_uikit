import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

enum DialogButtonType { buttonWhite, buttonBlack }

extension Factory on BuildContext {
  Widget smallButton({
    String? text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    bool? gradient,
    bool? isTextButton,
    bool? outlined,
    bool? blurred,
  }) {
    return WidgetsFactory.of(this)!
        .createSmallButton(
          text: text ?? '',
          onPressed: onPressed,
          icon: icon,
          color: color,
          gradient: gradient ?? false,
          isTextButton: isTextButton ?? false,
          outlined: outlined,
          blurred: blurred,
        )
        .build(this);
  }

  Widget dialogButton({
    required String text,
    VoidCallback? onPressed,
    DialogButtonType? dialogButtonType,
    bool? small,
  }) {
    return WidgetsFactory.of(this)!
        .createDialogButton(
          text: text,
          onPressed: onPressed,
          dialogButtonType: dialogButtonType,
          small: small,
        )
        .build(this);
  }

  Widget button({
    String? text,
    VoidCallback? onPressed,
    Widget? icon,
    bool? gradient,
    bool? isTextButton,
    bool? outlined,
    bool? blurred,
  }) {
    return WidgetsFactory.of(this)!
        .createOrdinaryButton(
          text: text ?? '',
          onPressed: onPressed,
          icon: icon,
          gradient: gradient ?? false,
          isTextButton: isTextButton ?? false,
          outlined: outlined,
          blurred: blurred,
        )
        .build(this);
  }

  Widget userTile({
    required String name,
    required String username,
    required String avatarUrl,
    required UserTileType type,
  }) {
    return WidgetsFactory.of(this)!
        .createUserTile(
          name: name,
          username: username,
          avatarUrl: avatarUrl,
          type: type,
        )
        .build(this);
  }
}
