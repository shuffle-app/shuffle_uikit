import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

extension FactoryExtention on BuildContext {
  Widget iconButtonNoPadding({
    required BaseUiKitButtonData data,
  }) =>
      WidgetsFactory.of(this)!.createIconButtonNoPadding(data: data).build(this);

  Widget userAvatar({
    required UserAvatarSize size,
    required UserTileType type,
    String? imageUrl,
    required String userName,
    bool showAchievements = false,
    int? badgeValue,
  }) =>
      WidgetsFactory.of(this)!
          .createUserAvatar(
            size: size,
            type: type,
            imageUrl: imageUrl,
            userName: userName,
            showAchievements: showAchievements,
            badgeValue: badgeValue,
          )
          .build(this);

  Widget createSnackBar({
    required String message,
    required AppSnackBarType appSnackBarType,
  }) {
    return WidgetsFactory.of(this)!.createSnackBar(message: message, appSnackBarType: appSnackBarType).build(this);
  }

  Widget outlinedBadgeButton({
    required BaseUiKitButtonData data,
    Alignment? badgeAlignment,
    int? badgeValue,
  }) {
    return WidgetsFactory.of(this)!
        .createOutlinedBadgeButton(
          data: data,
          badgeAlignment: badgeAlignment,
          value: badgeValue,
        )
        .build(this);
  }

  Widget outlinedGradientButton({
    required BaseUiKitButtonData data,
    required GradientBoxBorder gradient,
  }) {
    return WidgetsFactory.of(this)!
        .createOutlinedGradientButton(
          data: data,
          gradient: gradient,
        )
        .build(this);
  }

  Widget smallGradientButton({required BaseUiKitButtonData data}) {
    return WidgetsFactory.of(this)!.createSmallGradientButton(data: data).build(this);
  }

  Widget midSizeGradientButton({required BaseUiKitButtonData data}) {
    return WidgetsFactory.of(this)!.createMidSizeGradientButton(data: data).build(this);
  }

  Widget midSizeOutlinedButton({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
    bool? blurred,
    Gradient? gradient,
  }) {
    return WidgetsFactory.of(this)!
        .createMidSizeOutlinedButton(
          data: data,
          borderRadius: borderRadius,
          blurred: blurred,
          gradient: gradient,
        )
        .build(this);
  }

  Widget createSmallOutlinedButton({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
    bool? blurred,
    Gradient? gradient,
  }) {
    return WidgetsFactory.of(this)!
        .createSmallOutlinedButton(data: data, borderRadius: borderRadius, blurred: blurred, gradient: gradient)
        .build(this);
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
    required BaseUiKitButtonData data,
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
  }) {
    return WidgetsFactory.of(this)!
        .createSmallButton(
          data: data,
          isTextButton: isTextButton ?? false,
          blurred: blurred,
          uppercase: uppercase,
        )
        .build(this);
  }

  Widget boxIconButton({
    required BaseUiKitButtonData data,
    bool? isSelected,
  }) {
    return WidgetsFactory.of(this)!
        .createBoxIconButton(
          data: data,
          isSelected: isSelected,
        )
        .build(this);
  }

  Widget coloredButtonWithBorderRadius({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
  }) {
    return WidgetsFactory.of(this)!
        .createColoredButtonWithBorderRadius(
          data: data,
          borderRadius: borderRadius,
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
    bool? blurred,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
  }) {
    return WidgetsFactory.of(this)!
        .createOutlinedButton(
          data: data,
          borderColor: borderColor,
          hideBorder: hideBorder,
          isGradientEnabled: isGradientEnabled,
          blurred: blurred,
          padding: padding,
          borderRadius: borderRadius,
        )
        .build(this);
  }

  Widget smallOutlinedButton({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
    bool? blurred,
    Gradient? gradient,
    double? blurValue,
  }) {
    return WidgetsFactory.of(this)!
        .createSmallOutlinedButton(
          data: data,
          borderRadius: borderRadius,
          blurred: blurred,
          gradient: gradient,
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

  Widget gradientButton({
    required BaseUiKitButtonData data,
    final EdgeInsetsGeometry? padding,
  }) {
    return WidgetsFactory.of(this)!
        .createGradientButton(
          data: data,
          padding: padding,
        )
        .build(this);
  }

  Widget userTile({
    required BaseUiKitUserTileData data,
  }) {
    return WidgetsFactory.of(this)!.createUserTile(data: data).build(this);
  }

  Widget advertisementImageBanner({
    required BaseUiKitAdvertisementImageBannerData data,
  }) =>
      WidgetsFactory.of(this)!.createAdvertisementImageBanner(data: data).build(this);

  Widget advertisementTextBanner({
    required BaseUiKitAdvertisementTextBannerData data,
  }) =>
      WidgetsFactory.of(this)!.createAdvertisementTextBanner(data: data).build(this);

  Widget notificationPopUp({
    bool showTwoNotifications = false,
    required NotificationPopupRequiredData requiredData,
    Widget? primaryActionWidget,
    Widget? secondaryActionWidget,
    Widget? dismissActionWidget,
  }) {
    Widget popUp = WidgetsFactory.of(this)!
        .createNotificationPopUp(
          showTwoNotifications: showTwoNotifications,
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
