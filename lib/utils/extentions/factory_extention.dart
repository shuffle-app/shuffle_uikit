import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

extension FactoryExtention on BuildContext {
  Widget smallGradientButton({required BaseUiKitButtonData data}) {
    return WidgetsFactory.of(this)!.createSmallGradientButton(data: data).build(this);
  }

  Widget createSmallOutlinedButton({BaseUiKitButtonData? data, Color? color, bool? blurred}) {
    return WidgetsFactory.of(this)!.createSmallOutlinedButton(data: data, color: color, blurred: blurred).build(this);
  }

  Widget buttonWithProgress({
    BaseUiKitButtonData? data,
    double? progress,
    bool? blurred,
  }) {
    return WidgetsFactory.of(this)!
        .createButtonWithProgress(
          data: data,
          progress: progress,
          blurred: blurred,
        )
        .build(this);
  }

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

  Widget smallButton({
    required BaseUiKitButtonData data,
    bool? isTextButton,
    bool? blurred,
    bool uppercase = true,
    Color? color,
  }) {
    return WidgetsFactory.of(this)!
        .createSmallButton(
          data: data,
          isTextButton: isTextButton ?? false,
          blurred: blurred,
          uppercase: uppercase,
          color: color,
        )
        .build(this);
  }

  Widget bouncingButton({
    required BaseUiKitButtonData data,
    bool? blurred,
    bool? small,
  }) {
    return WidgetsFactory.of(this)!
        .createBouncingIconButton(
          data: data,
          blurred: blurred,
          small: small,
        )
        .build(this);
  }

  Widget outlinedButton({
    required BaseUiKitButtonData data,
    bool? hideBorder,
    Color? borderColor,
    bool? isGradientEnabled,
  }) {
    return WidgetsFactory.of(this)!
        .createOutlinedButton(
          data: data,
          borderColor: borderColor,
          hideBorder: hideBorder,
          isGradientEnabled: isGradientEnabled,
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
          blurred: blurred,
        )
        .build(this);
  }

  Widget dialogButton({
    required BaseUiKitButtonData data,
    DialogButtonType? dialogButtonType,
    bool? small,
    bool? isOutlined,
  }) {
    return WidgetsFactory.of(this)!
        .createDialogButton(
          data: data,
          dialogButtonType: dialogButtonType,
          small: small,
          isOutlined: isOutlined,
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

  Widget button({required BaseUiKitButtonData data, bool? isTextButton, bool? blurred, bool reversed = false}) {
    return WidgetsFactory.of(this)!
        .createOrdinaryButton(data: data, isTextButton: isTextButton ?? false, blurred: blurred, reversed: reversed)
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
    required BaseUiKitUserTileData data,
  }) {
    return WidgetsFactory.of(this)!.createUserTile(data: data).build(this);
  }

  Widget notificationPopUp({
    required NotificationPopupRequiredData requiredData,
    Widget? primaryActionWidget,
    Widget? secondaryActionWidget,
    Widget? dismissActionWidget,
  }) {
    Widget popUp = WidgetsFactory.of(this)!
        .createNotificationPopUp(
          requiredData: requiredData,
          primaryActionWidget: primaryActionWidget,
          secondaryActionWidget: secondaryActionWidget,
          dismissActionWidget: dismissActionWidget,
        )
        .build(this);
    if (requiredData.hasShadow ?? false) {
      return UiKitShadowWrapper(
        borderRadius: BorderRadiusFoundation.all24,
        backgroundColor: requiredData.backgroundColor,
        child: popUp,
      );
    }

    return popUp;
  }
}

enum DialogButtonType { buttonWhite, buttonBlack, buttonRed }
