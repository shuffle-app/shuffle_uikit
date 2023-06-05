import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

extension FactoryExtention on BuildContext {
  Widget badgeButtonNoValue({
    String? text,
    VoidCallback? onPressed,
    Widget? icon,
    Alignment? badgeAlignment,
  }) {
    return WidgetsFactory.of(this)!
        .createBadgeButtonNoValue(
          text: text,
          onPressed: onPressed,
          icon: icon,
          badgeAlignment: badgeAlignment,
        )
        .build(this);
  }

  Widget smallButton({
    String? text,
    VoidCallback? onPressed,
    Widget? icon,
    bool? isTextButton,
    bool? blurred,
  }) {
    return WidgetsFactory.of(this)!
        .createSmallButton(
          text: text ?? '',
          onPressed: onPressed,
          icon: icon,
          isTextButton: isTextButton ?? false,
          blurred: blurred,
        )
        .build(this);
  }

  Widget outlinedButton({
    String? text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
  }) {
    return WidgetsFactory.of(this)!
        .createOutlinedButton(
          text: text ?? '',
          onPressed: onPressed,
          icon: icon,
          color: color,
        )
        .build(this);
  }

  Widget smallOutlinedButton({
    String? text,
    VoidCallback? onPressed,
    ImageWidget? icon,
    Color? color,
  }) {
    return WidgetsFactory.of(this)!
        .createSmallOutlinedButton(
          text: text,
          onPressed: onPressed,
          icon: icon,
          color: color,
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

  Widget badgeButton({
    String? text,
    VoidCallback? onPressed,
    Widget? icon,
    int? badgeValue,
    Alignment? badgeAlignment,
  }) {
    return WidgetsFactory.of(this)!
        .createBadgeButtonWithValue(
          text: text,
          onPressed: onPressed,
          icon: icon,
          badgeValue: badgeValue,
          alignment: badgeAlignment,
        )
        .build(this);
  }

  Widget button({
    String? text,
    VoidCallback? onPressed,
    Widget? icon,
    bool? isTextButton,
    bool? blurred,
  }) {
    return WidgetsFactory.of(this)!
        .createOrdinaryButton(
          text: text ?? '',
          onPressed: onPressed,
          icon: icon,
          isTextButton: isTextButton ?? false,
          blurred: blurred,
        )
        .build(this);
  }

  Widget gradientButton({
    String text = '',
    VoidCallback? onPressed,
    Widget? icon,
  }) {
    return WidgetsFactory.of(this)!
        .createGradientButton(
          text: text,
          onPressed: onPressed,
          icon: icon,
        )
        .build(this);
  }

  Widget userTile({
    String? name,
    String? username,
    String? avatarUrl,
    UserTileType? type,
    VoidCallback? onTap,
  }) {
    return WidgetsFactory.of(this)!
        .createUserTile(
          name: name,
          username: username,
          avatarUrl: avatarUrl,
          type: type,
          onTap: onTap,
        )
        .build(this);
  }

  Widget notificationPopUp({
    required NotificationPopupRequiredData requiredData,
    Widget? primaryActionWidget,
    Widget? secondaryActionWidget,
    Widget? dismissActionWidget,
    bool? hasShadow,
  }) {
    return WidgetsFactory.of(this)!
        .createNotificationPopUp(
          requiredData: requiredData,
          primaryActionWidget: primaryActionWidget,
          secondaryActionWidget: secondaryActionWidget,
          dismissActionWidget: dismissActionWidget,
          hasShadow: hasShadow,
        )
        .build(this);
  }
}

enum DialogButtonType { buttonWhite, buttonBlack, buttonRed }
