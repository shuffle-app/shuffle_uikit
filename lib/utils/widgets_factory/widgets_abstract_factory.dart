import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/buttons/box_icon_button.dart';
import 'package:shuffle_uikit/ui_kit/atoms/buttons/ui_kit_icon_button_no_padding.dart';
import 'package:shuffle_uikit/ui_kit/molecules/tiles/user/badged_influncer_user_tile.dart';
import 'package:shuffle_uikit/ui_kit/molecules/tiles/user/badged_premium_user_tile.dart';
import 'package:shuffle_uikit/ui_kit/molecules/tiles/user/badged_pro_user_tile.dart';

import '../../ui_kit/atoms/user/avatars/ui_kit_user_avatar_90_x_90.dart';

abstract class WidgetsAbstractFactory {
  ButtonFactory createIconButtonNoPadding({
    required BaseUiKitButtonData data,
  });

  ButtonFactory createOutlinedBadgeButton({
    required BaseUiKitButtonData data,
    Alignment? badgeAlignment,
    int? value,
  });

  ButtonFactory createBoxIconButton({
    required BaseUiKitButtonData data,
  });

  ButtonFactory createOutlinedGradientButton({
    required BaseUiKitButtonData data,
    required GradientBoxBorder gradient,
  });

  ButtonFactory createBouncingIconButton({
    required BaseUiKitButtonData data,
    bool? blurred,
  });

  ButtonFactory createSmallGradientButton({
    required BaseUiKitButtonData data,
  });

  ButtonFactory createMidSizeGradientButton({
    required BaseUiKitButtonData data,
  });

  ButtonFactory createButtonWithProgress({
    BaseUiKitButtonData? data,
    double? progress,
    bool? blurred,
  });

  NotificationPopUpFactory createNotificationPopUp({
    required NotificationPopupRequiredData requiredData,
    Widget? primaryActionWidget,
    Widget? secondaryActionWidget,
    Widget? dismissActionWidget,
  });

  ButtonFactory createBadgeButtonNoValue({
    required BaseUiKitButtonData data,
    Alignment? badgeAlignment,
  });

  ButtonFactory createBadgeButtonWithValue({
    required BaseUiKitButtonData data,
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
    bool uppercase,
  });

  ButtonFactory createOutlinedButton({
    required BaseUiKitButtonData data,
    Color? borderColor,
  });

  ButtonFactory createSmallOutlinedButton({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
  });

  ButtonFactory createMidSizeOutlinedButton({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
    bool? blurred,
    Gradient? gradient,
    double? blurValue,
  });

  ButtonFactory createColoredButtonWithBorderRadius({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
  });

  ButtonFactory createGradientButton({
    required BaseUiKitButtonData data,
  });

  UserTileFactory createUserTile({
    required BaseUiKitUserTileData data,
  });

  AdvertisementFactory createAdvertisementTextBanner({
    required BaseUiKitAdvertisementTextBannerData data,
  });

  AdvertisementFactory createAdvertisementImageBanner({
    required BaseUiKitAdvertisementImageBannerData data,
  });

  UserAvatarFactory createUserAvatar({
    required UserAvatarSize size,
    required UserTileType type,
    required String imageUrl,
    required String userName,
    required bool showAchievements,
  });

  SnackBarFactory createSnackBar({
    required AppSnackBarType appSnackBarType,
    required String message,
  });
// InputFieldFactory createInputField({
//   required TextEditingController controller,
//   String? hintText,
//   String? errorText,
//   bool enabled = true,
//   String? Function(String?)? validator,
// });
}

abstract class SnackBarFactory {
  Widget build(BuildContext context);
}

abstract class ButtonFactory {
  Widget build(BuildContext context);
}

abstract class AdvertisementFactory {
  Widget build(BuildContext context);
}

abstract class UserTileFactory {
  Widget build(BuildContext context);
}

abstract class NotificationPopUpFactory {
  Widget build(BuildContext context);
}

abstract class UserAvatarFactory {
  Widget build(BuildContext context);
}

class WidgetsFactory extends InheritedWidget implements WidgetsAbstractFactory {
  const WidgetsFactory({required super.child, super.key});

  static WidgetsFactory? of(BuildContext context) {
    final instance = context.findAncestorWidgetOfExactType<WidgetsFactory>();

    return instance;
  }

  @override
  ButtonFactory createIconButtonNoPadding({
    required BaseUiKitButtonData data,
  }) {
    if (data.iconInfo == null) throw UnimplementedError('IconInfo is required');
    return UiKitIconButtonNoPadding(
      iconData: data.iconInfo!,
      onPressed: data.onPressed,
    );
  }

  @override
  UserAvatarFactory createUserAvatar({
    required UserAvatarSize size,
    required UserTileType type,
    String? imageUrl,
    required String userName,
    required bool showAchievements,
    int? badgeValue,
  }) {
    return AvatarStackWrapper(
      showAchievements: showAchievements,
      badgeValue: badgeValue,
      child: switch (size) {
        (UserAvatarSize.x20x20) => UiKitUserAvatar20x20(
            type: type,
            imageUrl: imageUrl ?? '',
            userName: userName,
          ),
        (UserAvatarSize.x24x24) => UiKitUserAvatar24x24(
            type: type,
            imageUrl: imageUrl ?? '',
            userName: userName,
          ),
        (UserAvatarSize.x32x32) => UiKitUserAvatar32x32(
            type: type,
            imageUrl: imageUrl ?? '',
            userName: userName,
          ),
        (UserAvatarSize.x40x40) => UiKitUserAvatar40x40(
            type: type,
            imageUrl: imageUrl ?? '',
            userName: userName,
          ),
        (UserAvatarSize.x48x48) => UiKitUserAvatar48x48(
            type: type,
            imageUrl: imageUrl ?? '',
            userName: userName,
          ),
        (UserAvatarSize.x60x60) => UiKitUserAvatar60x60(
            type: type,
            imageUrl: imageUrl ?? '',
            userName: userName,
          ),
        (UserAvatarSize.x120x120) => UiKitUserAvatar120x120(
            type: type,
            imageUrl: imageUrl ?? '',
            userName: userName,
          ),
        (UserAvatarSize.x90x90) => UiKitUserAvatar90x90(
            type: type,
            imageUrl: imageUrl ?? '',
            userName: userName,
          ),
      },
    );
  }

  @override
  ButtonFactory createOutlinedBadgeButton({
    required BaseUiKitButtonData data,
    Alignment? badgeAlignment,
    int? value,
  }) {
    final hasIcon = data.iconWidget != null || data.iconInfo != null;
    final hasValue = value != null && value != 0;

    if (hasIcon && !hasValue) {
      return OutlinedBadgeIconButton(
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
        icon: data.iconWidget,
        badgeAlignment: badgeAlignment,
      );
    }

    throw UnimplementedError('Outlined badge button with your parameters is not implemented');
  }

  @override
  ButtonFactory createOutlinedGradientButton({
    required BaseUiKitButtonData data,
    required GradientBoxBorder gradient,
  }) {
    return OutlinedGradientButton(
      text: data.text ?? '',
      onPressed: data.onPressed,
      gradientBorder: gradient,
      loading: data.loading,
      fit: data.fit,
    );
  }

  @override
  ButtonFactory createColoredButtonWithBorderRadius({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
  }) {
    return ColoredButtonWithBorderRadius(
      borderRadius: borderRadius,
      text: data.text,
      backgroundColor: data.backgroundColor,
      textColor: data.textColor,
      onPressed: data.onPressed,
      loading: data.loading,
      fit: data.fit,
      autoSizeGroup: data.autoSizeGroup,
    );
  }

  @override
  ButtonFactory createBoxIconButton({
    required BaseUiKitButtonData data,
    bool? isSelected,
  }) {
    return BoxIconButton(
      iconInfo: data.iconInfo,
      onPressed: data.onPressed,
      icon: data.iconWidget,
      backgroundColor: data.backgroundColor,
      isSelected: isSelected,
    );
  }

  @override
  ButtonFactory createMidSizeOutlinedButton({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
    bool? blurred,
    Gradient? gradient,
    double? blurValue,
  }) {
    final hasIcon = data.iconWidget != null || data.iconInfo != null;
    final hasText = data.text != null;

    if (hasIcon) {
      return MidSizeOutlinedIconButton(
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
        loading: data.loading,
        borderColor: data.borderColor,
        fit: data.fit,
      );
    } else if (hasText) {
      return MidSizeOutlinedTextButton(
        text: data.text!,
        isGradientEnabled: gradient != null,
        loading: data.loading,
        onPressed: data.onPressed,
        borderColor: data.borderColor,
      );
    }

    throw UnimplementedError('Mid size outlined button with your parameters is not implemented');
  }

  @override
  ButtonFactory createSmallOutlinedButton({
    required BaseUiKitButtonData data,
    BorderRadius? borderRadius,
    bool? blurred,
    Gradient? gradient,
    double? blurValue,
  }) {
    final hasIcon = data.iconWidget != null || data.iconInfo != null;
    final hasText = data.text?.isNotEmpty ?? false;
    if (hasIcon && hasText && !(blurred ?? false)) {
      return SmallOutlinedButtonWithIconAndText(
        text: data.text ?? '',
        icon: data.iconWidget,
        textColor: data.textColor,
        borderColor: data.borderColor,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
        loading: data.loading,
        fit: data.fit,
      );
    }
    if (!(blurred ?? false) && hasIcon) {
      return SmallOutlinedButtonNoBlur(
        onPressed: data.onPressed,
        text: data.text ?? '',
        borderColor: data.borderColor,
        textColor: data.textColor,
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        loading: data.loading,
        backgroundColor: data.backgroundColor,
        fit: data.fit,
      );
    } else if ((data.text != null && (data.text?.isNotEmpty ?? false)) || !hasIcon) {
      return SmallOutlinedButton(
        onPressed: data.onPressed,
        gradient: gradient,
        blurred: blurred ?? false,
        text: data.text ?? '',
        backgroundColor: data.backgroundColor,
        borderColor: data.borderColor,
        textColor: gradient != null ? Colors.white : data.textColor,
        loading: data.loading,
        group: data.autoSizeGroup,
      );
    } else if ((blurred ?? false) && hasIcon && !hasText) {
      return SmallBlurredOutlinedIconButton(
          onPressed: data.onPressed,
          icon: data.iconWidget,
          iconInfo: data.iconInfo,
          borderColor: data.borderColor,
          backgroundColor: data.backgroundColor,
          loading: data.loading,
          blurValue: blurValue,
          gradient: gradient,
          borderRadius: borderRadius);
    } else if (!(blurred ?? false) && hasIcon && !hasText) {
      return SmallOutlinedIconButton(
        onPressed: data.onPressed,
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        borderColor: data.borderColor,
        loading: data.loading,
      );
    } else {
      throw UnimplementedError('Outlined button with your parameters is not implemented');
    }
  }

  @override
  ButtonFactory createBadgeButtonNoValue({
    required BaseUiKitButtonData data,
    Alignment? badgeAlignment,
  }) {
    return BadgeIconButtonNoValue(
      onPressed: data.onPressed,
      icon: data.iconWidget,
      iconInfo: data.iconInfo,
      badgeAlignment: badgeAlignment,
    );
  }

  @override
  ButtonFactory createOutlinedButton({
    required BaseUiKitButtonData data,
    bool? blurred,
    Color? borderColor,
    bool? hideBorder,
    bool? isGradientEnabled,
    EdgeInsetsGeometry? padding,
  }) {
    final hasIcon = data.iconWidget != null || data.iconInfo != null;

    if ((data.text?.isEmpty ?? true) && hasIcon) {
      if (blurred ?? false) {
        return OutlinedBlurIconButton(
          icon: data.iconWidget,
          iconInfo: data.iconInfo,
          onPressed: data.onPressed,
          loading: data.loading,
        );
      }

      return OutlinedIconButton(
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
        hideBorder: hideBorder ?? false,
        loading: data.loading,
        borderColor: borderColor,
        padding: padding,
      );
    }
    if (data.text?.isNotEmpty ?? false) {
      return OutlinedTextButton(
        text: data.text ?? '',
        onPressed: data.onPressed,
        loading: data.loading,
        borderColor: borderColor,
        textColor: data.textColor,
        backgroundColor: data.backgroundColor,
        isGradientEnabled: isGradientEnabled ?? false,
      );
    } else {
      throw UnimplementedError('Outlined button with your parameters is not implemented');
    }
  }

  @override
  ButtonFactory createGradientButton({
    required BaseUiKitButtonData data,
    final EdgeInsetsGeometry? padding,
  }) {
    final hasIcon = data.iconWidget != null || data.iconInfo != null;
    final gradientIconButton = hasIcon && (data.text?.isEmpty ?? true);
    if (gradientIconButton) {
      return GradientIconButton(
        fit: data.fit,
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
        loading: data.loading,
      );
    } else if (!hasIcon && (data.text?.isNotEmpty ?? false)) {
      return GradientButton(
        fit: data.fit,
        text: data.text ?? '',
        onPressed: data.onPressed,
        loading: data.loading,
        autoSizeGroup: data.autoSizeGroup,
        padding: padding,
      );
    } else if (hasIcon && (data.text?.isNotEmpty ?? false)) {
      return GradientButtonWithTextAndIcon(
        fit: data.fit,
        text: data.text ?? '',
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
        loading: data.loading,
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
    bool reversed = false,
  }) {
    final hasIcon = data.iconWidget != null || data.iconInfo != null;
    final onlyIconButton = hasIcon && (data.text?.isEmpty ?? true) && !isTextButton && !(blurred ?? false);
    if (isTextButton) {
      if (reversed) {
        return OrdinaryReversedTextButton(
          text: data.text ?? '',
          onPressed: data.onPressed,
          icon: data.iconWidget,
          iconInfo: data.iconInfo,
        );
      }

      return OrdinaryTextButton(
        text: data.text ?? '',
        onPressed: data.onPressed,
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
      );
    } else if (hasIcon && !onlyIconButton) {
      return OrdinaryButtonWithIcon(
        fit: data.fit,
        text: data.text,
        onPressed: data.onPressed,
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        loading: data.loading,
      );
    } else if (onlyIconButton) {
      return FilledIconButton(
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
        backgroundColor: data.backgroundColor,
      );
    } else if (hasIcon && (blurred ?? false)) {
      return BlurredButtonWithIcon(
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
      );
    } else {
      return OrdinaryButton(
        fit: data.fit,
        text: data.text ?? '',
        onPressed: data.onPressed,
        loading: data.loading,
        backgroundColor: data.backgroundColor,
        textColor: data.textColor,
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
    bool uppercase = true,
  }) {
    final hasIcon = data.iconWidget != null || data.iconInfo != null;
    final hasBlur = blurred ?? false;
    if (!hasBlur && hasIcon && (data.text?.isNotEmpty ?? false)) {
      return SmallButtonWithTextAndIcon(
        text: data.text,
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
        fit: data.fit,
      );
    }
    if (hasIcon && hasBlur) {
      return SmallBlurredButtonWithIcon(
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
      );
    }
    if (hasIcon && !hasBlur) {
      return SmallButtonWithIcon(
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
      );
    }

    return SmallOrdinaryButton(
      text: data.text ?? '',
      onPressed: data.onPressed,
      uppercase: uppercase,
      backgroundColor: data.backgroundColor,
      textColor: data.textColor,
      loading: data.loading,
      fit: data.fit,
      group: data.autoSizeGroup,
    );
  }

  @override
  UserTileFactory createUserTile({
    required BaseUiKitUserTileData data,
  }) {
    if (data.noMaterialOverlay == true) {
      return UiKitLightweightUserTile(
        name: data.name,
        username: data.username,
        avatarUrl: data.avatarUrl,
        userType: data.type,
        userNameTextColor: data.userNameTextColor,
      );
    }

    if (data.showBadge ?? false) {
      switch (data.type) {
        case UserTileType.pro:
          return BadgedProUserTile(data: data);
        case UserTileType.ordinary:
          throw UnimplementedError('There is no ordinary user tile with badge');

        case UserTileType.premium:
          return BadgedPremiumUserTile(data: data);

        case UserTileType.influencer:
          return BadgedInfluncerUserTile(data: data);

        default:
          throw UnimplementedError('There is no user tile with badge');
      }
    }

    switch (data.type) {
      case UserTileType.pro:
        return ProUserTile(
          name: data.name,
          avatarUrl: data.avatarUrl,
          username: data.username,
          onTap: data.onTap,
        );
      case UserTileType.ordinary:
        return OrdinaryUserTile(
          name: data.name,
          avatarUrl: data.avatarUrl,
          username: data.username,
          onTap: data.onTap,
        );
      case UserTileType.premium:
        return PremiumUserTile(
          name: data.name,
          avatarUrl: data.avatarUrl,
          username: data.username,
          onTap: data.onTap,
        );
      case UserTileType.influencer:
        return InfluencerUserTile(
          name: data.name,
          avatarUrl: data.avatarUrl,
          username: data.username,
          onTap: data.onTap,
        );
      case null:
        return OrdinaryUserTile(
          name: data.name,
          avatarUrl: data.avatarUrl,
          username: data.username,
          onTap: data.onTap,
        );
    }
  }

  @override
  ButtonFactory createDialogButton({
    required BaseUiKitButtonData data,
    DialogButtonType? dialogButtonType,
    bool? small,
    bool? isOutlined,
  }) {
    switch (dialogButtonType) {
      case DialogButtonType.buttonWhite:
        return WhiteDialogButton(
          text: data.text ?? '',
          onPressed: data.onPressed,
          small: small ?? false,
          isOutlined: isOutlined ?? false,
        );
      case DialogButtonType.buttonBlack:
        return BlackDialogButton(
          text: data.text ?? '',
          fit: data.fit,
          onPressed: data.onPressed,
          small: small ?? false,
        );
      case null:
        throw UnimplementedError();
      case DialogButtonType.buttonRed:
        return RedDialogButton(
          text: data.text ?? '',
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
  }) {
    final hasAllActions = primaryActionWidget != null && secondaryActionWidget != null && dismissActionWidget != null;
    if (hasAllActions) {
      return AdditionalActionNotificationPopUp(
        requiredData: requiredData,
        primaryActionWidget: primaryActionWidget,
        secondaryActionWidget: secondaryActionWidget,
        dismissActionWidget: dismissActionWidget,
      );
    }

    return OrdinaryNotificationPopUp(
      requiredData: requiredData,
      primaryActionWidget: primaryActionWidget,
      dismissActionWidget: dismissActionWidget,
    );
  }

  @override
  ButtonFactory createBadgeButtonWithValue({
    BaseUiKitButtonData? data,
    int? badgeValue,
    Alignment? alignment,
  }) {
    return BadgeIconButton(
      icon: data?.iconWidget,
      iconInfo: data?.iconInfo,
      onPressed: data?.onPressed,
      badgeValue: badgeValue,
    );
  }

  @override
  ButtonFactory createButtonWithProgress({
    BaseUiKitButtonData? data,
    double? progress,
    bool? blurred,
  }) {
    if (blurred ?? false) {
      return BlurredProgressButton(
        text: data?.text,
        onPressed: data?.onPressed,
        progress: progress,
      );
    }

    return OrdinaryProgressButton(
      text: data?.text,
      onPressed: data?.onPressed,
      progress: progress,
    );
  }

  @override
  ButtonFactory createBouncingIconButton({
    required BaseUiKitButtonData data,
    bool? blurred,
    bool? small,
  }) {
    if (small ?? false) {
      return SmallBouncingBlurIconButton(
        onPressed: data.onPressed,
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
      );
    }

    return BouncingBlurButton(
      icon: data.iconWidget,
      iconInfo: data.iconInfo,
      onPressed: data.onPressed,
    );
  }

  @override
  ButtonFactory createSmallGradientButton({
    required BaseUiKitButtonData data,
  }) {
    final hasIcon = data.iconWidget != null || data.iconInfo != null;
    if (hasIcon && (data.text?.isEmpty ?? true)) {
      return SmallGradientIconButton(
        icon: data.iconWidget,
        iconInfo: data.iconInfo,
        onPressed: data.onPressed,
      );
    }

    return SmallGradientButton(
      text: data.text ?? '',
      onPressed: data.onPressed,
      loading: data.loading,
    );
  }

  @override
  AdvertisementFactory createAdvertisementTextBanner({
    required BaseUiKitAdvertisementTextBannerData data,
  }) {
    switch (data.size) {
      case AdvertisementBannerSize.small:
        return UiKitSmallTextAdBannerCard(
          decoration: data.decoration,
          imageLink: data.imageLink,
          textWidget: data.textWidget,
          textAlignment: data.textAlignment,
          textOffset: data.textExactOffset,
          availableWidth: data.availableWidth,
          onTap: data.onPressed,
          customHeight: data.customHeight,
          customPadding: data.customPadding,
        );
      case AdvertisementBannerSize.medium:
        return UiKitMediumTextAdBannerCard(
          decoration: data.decoration,
          customPadding: data.customPadding,
          textAlignment: data.textAlignment,
          imageLink: data.imageLink,
          textOffset: data.textExactOffset,
          textWidget: data.textWidget,
          availableWidth: data.availableWidth,
          onTap: data.onPressed,
          customHeight: data.customHeight,
        );
      case AdvertisementBannerSize.large:
        return UiKitLargeTextAdBannerCard(
          imageFit: data.imageFit,
          decoration: data.decoration,
          customPadding: data.customPadding,
          textOffset: data.textExactOffset,
          imageLink: data.imageLink,
          textWidget: data.textWidget,
          textAlignment: data.textAlignment,
          availableWidth: data.availableWidth,
          onTap: data.onPressed,
          customHeight: data.customHeight,
        );
    }
  }

  @override
  AdvertisementFactory createAdvertisementImageBanner({
    required BaseUiKitAdvertisementImageBannerData data,
  }) {
    switch (data.size) {
      case AdvertisementBannerSize.small:
        return UiKitSmallAdBannerCard(
          imageLink: data.imageLink,
          title: data.title,
          availableWidth: data.availableWidth,
          onTap: data.onPressed,
          customHeight: data.customHeight,
        );
      case AdvertisementBannerSize.medium:
        return UiKitMediumAdBannerCard(
          imageLink: data.imageLink,
          title: data.title,
          availableWidth: data.availableWidth,
          onTap: data.onPressed,
          customHeight: data.customHeight,
        );
      case AdvertisementBannerSize.large:
        return UiKitLargeAdBannerCard(
          imageLink: data.imageLink,
          title: data.title,
          availableWidth: data.availableWidth,
          onTap: data.onPressed,
          customHeight: data.customHeight,
        );
    }
  }

  @override
  SnackBarFactory createSnackBar({required AppSnackBarType appSnackBarType, required String message}) {
    switch (appSnackBarType) {
      case AppSnackBarType.success:
        return SuccessSnackBar(message: message);
      case AppSnackBarType.error:
        return ErrorSnackBar(message: message);
      case AppSnackBarType.warning:
        return WarningSnackBar(message: message);
      case AppSnackBarType.info:
        return InfoSnackBar(message: message);
      case AppSnackBarType.neutral:
        return NeutralSnackBar(message: message);
      default:
        return NeutralSnackBar(message: message);
    }
  }

  @override
  ButtonFactory createMidSizeGradientButton({
    required BaseUiKitButtonData data,
  }) {
    final hasText = data.text != null;
    final hasIcon = data.iconInfo != null || data.iconWidget != null;

    if (hasText && !hasIcon) {
      return MidSizeGradientButton(
        text: data.text!,
        onPressed: data.onPressed,
        loading: data.loading,
      );
    }

    throw UnimplementedError('There is no mid size gradient button with given parameters');
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

class AvatarStackWrapper extends StatelessWidget implements UserAvatarFactory {
  final bool showAchievements;
  final Widget child;
  final int? badgeValue;

  const AvatarStackWrapper({
    super.key,
    required this.showAchievements,
    required this.child,
    this.badgeValue,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        RepaintBoundary(child: child),
        if (badgeValue != null && badgeValue != 0)
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.05.sw,
              minHeight: 0.05.sw,
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: GradientFoundation.defaultRadialGradient,
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Text(
                badgeValue.toString(),
                style: regularTextTheme?.caption4.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ).paddingAll(EdgeInsetsFoundation.all2),
            ),
          ),
        if (showAchievements)
          Positioned(
              right: -3.sp,
              bottom: -3.sp,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: UiKitColors.pinkDark.withOpacity(0.6),
                    border: GradientFoundation.gradientBorder),
                child: ImageWidget(
                  rasterAsset: GraphicsFoundation.instance.png.goldenCup,
                  height: 13.sp,
                  width: 13.sp,
                ).paddingAll(3.sp),
              ))
      ],
    );
  }
}
