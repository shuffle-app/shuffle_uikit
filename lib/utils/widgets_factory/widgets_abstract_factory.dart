import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class WidgetsAbstractFactory {
  NotificationPopUpFactory createNotificationPopUp({
    required NotificationPopupRequiredData requiredData,
    Widget? primaryActionWidget,
    Widget? secondaryActionWidget,
    Widget? dismissActionWidget,
    bool? hasShadow,
  });

  ButtonFactory createBadgeButtonNoValue({
    BaseUiKitButtonData? data,
    Alignment? badgeAlignment,
  });

  ButtonFactory createBadgeButtonWithValue({
    BaseUiKitButtonData? data,
    int? badgeValue,
    Alignment? alignment,
  });

  ButtonFactory createOrdinaryButton({
    required BaseUiKitButtonData data,
    bool isTextButton = false,
    bool? blurred,
  });

  ButtonFactory createDialogButton({
    required BaseUiKitButtonData data,
    DialogButtonType? dialogButtonType,
    bool? small,
  });

  ButtonFactory createSmallButton({
    required BaseUiKitButtonData data,
    bool isTextButton = false,
    bool? blurred,
    bool uppercase
  });

  ButtonFactory createOutlinedButton({
    required BaseUiKitButtonData data,
    Color? color,
  });

  ButtonFactory createSmallOutlinedButton({
    BaseUiKitButtonData? data,
    Color? color,
  });

  ButtonFactory createGradientButton({
    required BaseUiKitButtonData data,
  });

  UserTileFactory createUserTile({
    required String name,
    required String username,
    required String avatarUrl,
    required UserTileType type,
  });
// InputFieldFactory createInputField({
//   required TextEditingController controller,
//   String? hintText,
//   String? errorText,
//   bool enabled = true,
//   String? Function(String?)? validator,
// });
}

abstract class ButtonFactory {
  Widget build(BuildContext context);
}

abstract class UserTileFactory {
  Widget build(BuildContext context);
}

abstract class NotificationPopUpFactory {
  Widget build(BuildContext context);
}

class WidgetsFactory extends InheritedWidget implements WidgetsAbstractFactory {
  const WidgetsFactory({required super.child, super.key});

  static WidgetsFactory? of(BuildContext context) {
    final instance = context.findAncestorWidgetOfExactType<WidgetsFactory>();

    return instance;
  }

  @override
  ButtonFactory createSmallOutlinedButton({
    BaseUiKitButtonData? data,
    Color? color,
  }) {
    if ((data?.text != null && data!.text.isNotEmpty) || data?.icon != null) {
      return SmallOutlinedButton(onPressed: data?.onPressed, text: data?.text ?? '', borderColor: color, textColor: color, icon: data!.icon! as ImageWidget);
    } else {
      throw UnimplementedError('Outlined button with your parameters is not implemented');
    }
  }

  @override
  ButtonFactory createBadgeButtonNoValue({
    BaseUiKitButtonData? data,
    Alignment? badgeAlignment,
  }) {

    return BadgeIconButtonNoValue(
      onPressed: data?.onPressed,
      icon: data?.icon,
      badgeAlignment: badgeAlignment,
    );
  }

  @override
  ButtonFactory createOutlinedButton({
    required BaseUiKitButtonData data,
    bool? blurred,
    Color? color,
  }) {
    if (data.text.isEmpty && data.icon != null) {
      return OutlinedIconButton(
        icon: data.icon,
        onPressed: data.onPressed,
      );
    } else {
      throw UnimplementedError('Outlined button with your parameters is not implemented');
    }
  }

  @override
  ButtonFactory createGradientButton({
    required BaseUiKitButtonData data,
  }) {
    final hasIcon = data.icon != null;
    final gradientIconButton = hasIcon && data.text.isEmpty;
    if (gradientIconButton) {
      return GradientIconButton(
        icon: data.icon!,
        onPressed: data.onPressed,
        borderRadius: BorderRadiusFoundation.max,
      );
    } else if (!hasIcon && data.text.isNotEmpty) {
      return GradientButton(
        text: data.text,
        onPressed: data.onPressed,
      );
    } else if (hasIcon && data.text.isNotEmpty) {
      return GradientButtonWithTextAndIcon(
        text: data.text,
        icon: data.icon!,
        onPressed: data.onPressed,
      );
    } else {
      throw UnimplementedError('Gradient button with your parameters is not implemented');
    }
  }

  @override
  ButtonFactory createOrdinaryButton({
    required BaseUiKitButtonData data,
    bool isTextButton = false,
    bool? blurred,
  }) {
    final hasIcon = data.icon != null;
    final onlyIconButton = hasIcon && data.text.isEmpty && !isTextButton && !(blurred ?? false);
    if (isTextButton) {
      return OrdinaryTextButton(
        text: data.text,
        onPressed: data.onPressed,
        icon: data.icon,
      );
    } else if (hasIcon && !onlyIconButton && !(blurred ?? false)) {
      return OrdinaryButtonWithIcon(
        text: data.text,
        onPressed: data.onPressed,
        icon: data.icon!,
      );
    } else if (onlyIconButton) {
      return FilledIconButton(
        icon: data.icon!,
        onPressed: data.onPressed,
      );
    } else if (hasIcon && (blurred ?? false)) {
      return BlurredButtonWithIcon(
        icon: data.icon!,
        onPressed: data.onPressed,
      );
    } else {
      return OrdinaryButton(
        text: data.text,
        onPressed: data.onPressed,
      );
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  @override
  ButtonFactory createSmallButton({
    required BaseUiKitButtonData data,
    bool isTextButton = false,
    bool? blurred,
    bool uppercase = true
  }) {
    final hasIcon = data.icon != null;
    final hasBlur = blurred ?? false;
    if (hasIcon && hasBlur) {
      return SmallBlurredButtonWithIcon(
        icon: data.icon!,
        onPressed: data.onPressed,
      );
    }
    if (hasIcon && !hasBlur) {
      return SmallButtonWithIcon(
        icon: data.icon,
        onPressed: data.onPressed,
      );
    }

    return SmallOrdinaryButton(
      text: data.text,
      onPressed: data.onPressed,
        uppercase:uppercase
    );
  }

  @override
  UserTileFactory createUserTile({
    String? name,
    String? username,
    String? avatarUrl,
    UserTileType? type,
    VoidCallback? onTap,
    
  }) {
    switch (type) {
      case UserTileType.pro:
        return ProUserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          onTap: onTap,

        );
      case UserTileType.ordinary:
        return OrdinaryUserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          onTap: onTap,
        );
      case UserTileType.premium:
        return PremiumUserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          onTap: onTap,
        );
      case UserTileType.influencer:
        return InfluencerUserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          onTap: onTap,
        );
      case null:
        return OrdinaryUserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          onTap: onTap,
        );
    }
  }

  @override
  ButtonFactory createDialogButton({
    required BaseUiKitButtonData data,
    DialogButtonType? dialogButtonType,
    bool? small,
  }) {
    switch (dialogButtonType) {
      case DialogButtonType.buttonWhite:
        return WhiteDialogButton(
          text: data.text,
          onPressed: data.onPressed,
          small: small ?? false,
        );
      case DialogButtonType.buttonBlack:
        return BlackDialogButton(
          text: data.text,
          onPressed: data.onPressed,
          small: small ?? false,
        );
      case null:
        throw UnimplementedError();
      case DialogButtonType.buttonRed:
        return RedDialogButton(
          text: data.text,
          onPressed: data.onPressed,
          small: small ?? false,
        );
    }
  }

  @override
  NotificationPopUpFactory createNotificationPopUp({
    required NotificationPopupRequiredData requiredData,
    Widget? primaryActionWidget,
    Widget? secondaryActionWidget,
    Widget? dismissActionWidget,
    bool? hasShadow,
  }) {
    final hasAllActions = primaryActionWidget != null && secondaryActionWidget != null && dismissActionWidget != null;
    if (hasAllActions) {
      return AdditionalActionNotificationPopUp(
        requiredData: requiredData,
        primaryActionWidget: primaryActionWidget,
        secondaryActionWidget: secondaryActionWidget,
        dismissActionWidget: dismissActionWidget,
        hasShadow: hasShadow,
      );
    }

    return OrdinaryNotificationPopUp(
      requiredData: requiredData,
      primaryActionWidget: primaryActionWidget,
      dismissActionWidget: dismissActionWidget,
      hasShadow: hasShadow,
    );
  }

  @override
  ButtonFactory createBadgeButtonWithValue({
    BaseUiKitButtonData? data,
    int? badgeValue,
    Alignment? alignment,
  }) {

    return BadgeIconButton(
      icon: data?.icon,
      onPressed: data?.onPressed,
      badgeValue: badgeValue,
    );
  }

// @override
// InputFieldFactory createInputField({
//   required TextEditingController controller,
//   String? hintText,
//   String? errorText,
//   bool enabled = true,
//   String? Function(String?)? validator,
// }) {
//   return InputField();
// }
}
