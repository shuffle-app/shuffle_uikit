import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

extension FactoryExtention on BuildContext {
  Widget badgeButtonNoValue({
    BaseUiKitButtonData? data,
    Alignment? badgeAlignment,
  }) {
    return WidgetsFactory.of(this)!
        .createBadgeButtonNoValue(
          data: data,
          badgeAlignment: badgeAlignment,
        )
        .build(this);
  }

  Widget smallButton(
      {required BaseUiKitButtonData data,
      bool? isTextButton,
      bool? blurred,
      bool uppercase = true}) {
    return WidgetsFactory.of(this)!
        .createSmallButton(
            data: data,
            isTextButton: isTextButton ?? false,
            blurred: blurred,
            uppercase: uppercase)
        .build(this);
  }

  Widget outlinedButton({
    required BaseUiKitButtonData data,
    Color? color,
  }) {
    return WidgetsFactory.of(this)!
        .createOutlinedButton(
          data: data,
          color: color,
        )
        .build(this);
  }

  Widget smallOutlinedButton({
    BaseUiKitButtonData? data,
    Color? color,
    bool? blurred,
  }) {
    return WidgetsFactory.of(this)!
        .createSmallOutlinedButton(
          data: data,
          color: color,
        blurred:blurred
        )
        .build(this);
  }

  Widget dialogButton({
    required BaseUiKitButtonData data,
    DialogButtonType? dialogButtonType,
    bool? small,
  }) {
    return WidgetsFactory.of(this)!
        .createDialogButton(
          data: data,
          dialogButtonType: dialogButtonType,
          small: small,
        )
        .build(this);
  }

  Widget badgeButton({
    BaseUiKitButtonData? data,
    int? badgeValue,
    Alignment? badgeAlignment,
  }) {
    return WidgetsFactory.of(this)!
        .createBadgeButtonWithValue(
          data: data,
          badgeValue: badgeValue,
          alignment: badgeAlignment,
        )
        .build(this);
  }

  Widget button({
    required BaseUiKitButtonData data,
    bool? isTextButton,
    bool? blurred,
  }) {
    return WidgetsFactory.of(this)!
        .createOrdinaryButton(
          data: data,
          isTextButton: isTextButton ?? false,
          blurred: blurred,
        )
        .build(this);
  }

  Widget gradientButton({required BaseUiKitButtonData data}) {
    return WidgetsFactory.of(this)!
        .createGradientButton(
          data: data,
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
    Widget popUp = WidgetsFactory.of(this)!
        .createNotificationPopUp(
          requiredData: requiredData,
          primaryActionWidget: primaryActionWidget,
          secondaryActionWidget: secondaryActionWidget,
          dismissActionWidget: dismissActionWidget,
        )
        .build(this);
    if (hasShadow ?? false) {
      return UiKitShadowWrapper(
        borderRadius: BorderRadiusFoundation.all24,
        child: popUp,
      );
    }

    return popUp;
  }
}

enum DialogButtonType { buttonWhite, buttonBlack, buttonRed }
