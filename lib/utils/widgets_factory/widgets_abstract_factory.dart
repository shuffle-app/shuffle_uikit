import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class WidgetsAbstractFactory {
  ButtonFactory createOrdinaryButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    bool gradient = false,
    bool isTextButton = false,
    bool? outlined,
    bool? blurred,
  });

  ButtonFactory createDialogButton({
    required String text,
    VoidCallback? onPressed,
    DialogButtonType? dialogButtonType,
    bool? small,
  });

  ButtonFactory createSmallButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    bool gradient = false,
    bool isTextButton = false,
    bool? outlined,
    bool? blurred,
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

class WidgetsFactory extends InheritedWidget implements WidgetsAbstractFactory {
  const WidgetsFactory({required super.child, super.key});

  static WidgetsFactory? of(BuildContext context) {
    final instance = context.findAncestorWidgetOfExactType<WidgetsFactory>();

    return instance;
  }

  @override
  ButtonFactory createOrdinaryButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    bool gradient = false,
    bool isTextButton = false,
    bool? outlined,
    bool? blurred,
  }) {
    final hasIcon = icon != null;
    final gradientIconButton = gradient && hasIcon && text.isEmpty;
    final onlyIconButton = hasIcon && text.isEmpty && !isTextButton && !(blurred ?? false);

    if (gradientIconButton) {
      return GradientIconButton(
        icon: icon,
        onPressed: onPressed,
      );
    } else if (gradient && !hasIcon && !onlyIconButton) {
      return GradientButton(
        text: text,
        onPressed: onPressed,
      );
    } else if (hasIcon && gradient && !onlyIconButton) {
      return GradientButtonWithIcon(
        text: text,
        icon: icon,
        onPressed: onPressed,
      );
    } else if (hasIcon && !gradient && !onlyIconButton && !(blurred ?? false)) {
      return OrdinaryButtonWithIcon(
        text: text,
        onPressed: onPressed,
        icon: icon,
      );
    } else if (isTextButton) {
      return OrdinaryTextButton(
        text: text,
        onPressed: onPressed,
      );
    } else if (onlyIconButton && (outlined ?? false)) {
      return OutlinedIconButton(
        icon: icon,
        onPressed: onPressed,
      );
    } else if (onlyIconButton) {
      return FilledIconButton(
        icon: icon,
        onPressed: onPressed,
      );
    } else if (hasIcon && (blurred ?? false)) {
      return BlurredButtonWithIcon(
        icon: icon,
        onPressed: onPressed,
      );
    } else {
      return OrdinaryButton(
        text: text,
        onPressed: onPressed,
      );
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }



  @override
  ButtonFactory createSmallButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    bool gradient = false,
    bool isTextButton = false,
    bool? outlined,
    bool? blurred,
  }) {
    final hasIcon = icon != null;
    if ((outlined ?? false) && isTextButton) {
      return SmallOutlinedButton(
        onPressed: onPressed,
        text: text,
        borderColor: color,
        textColor: color,
      );
    } else if (hasIcon && (blurred ?? false)) {
      return SmallBlurredButtonWithIcon(
        icon: icon,
        onPressed: onPressed,
      );
    }

    return SmallOrdinaryButton(
      text: text,
      onPressed: onPressed,
    );
  }

  @override
  UserTileFactory createUserTile({
    String? name,
    String? username,
    String? avatarUrl,
    UserTileType? type,
    Border? border,
    VoidCallback? onTap,
  }) {
    switch (type) {
      case UserTileType.pro:
        return ProUserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          border: border,
          onTap: onTap,
        );
      case UserTileType.ordinary:
        return UserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          border: border,
          onTap: onTap,
        );
      case UserTileType.premium:
        return PremiumUserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          border: border,
          onTap: onTap,
        );
      case UserTileType.influencer:
        return InfluencerUserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          border: border,
          onTap: onTap,
        );
      case null:
        return UserTile(
          name: name,
          avatarUrl: avatarUrl,
          username: username,
          border: border,
          onTap: onTap,
        );
    }
  }

  @override
  ButtonFactory createDialogButton({
    required String text,
    VoidCallback? onPressed,
    DialogButtonType? dialogButtonType,
    bool? small,
  }) {
    switch (dialogButtonType) {
      case DialogButtonType.buttonWhite:
        return DialogButton.white(
          text: text,
          onPressed: onPressed,
          small: small ?? false,
        );
      case DialogButtonType.buttonBlack:
        return DialogButton.black(
          text: text,
          onPressed: onPressed,
          small: small ?? false,
        );
      case null:
        throw UnimplementedError();
    }
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
