import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class WidgetsAbstractFactory {
  ButtonFactory createOrdinaryButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    bool gradient = false,
    bool isTextButton = false,
    bool? onlyIcon,
    bool? outlined,
    bool? blurred,
  });

  ButtonFactory createSmallButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    bool gradient = false,
    bool isTextButton = false,
    bool? dialogButton,
    DialogButtonType? dialogButtonType,
    bool? onlyIcon,
    bool? outlined,
    bool? blurred,
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

class WidgetsFactory extends InheritedWidget implements WidgetsAbstractFactory {
  const WidgetsFactory({required super.child, super.key});

  @override
  ButtonFactory createOrdinaryButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    bool gradient = false,
    bool isTextButton = false,
    bool? dialogButton,
    DialogButtonType? dialogButtonType,
    bool? onlyIcon,
    bool? outlined,
    bool? blurred,
  }) {
    final hasIcon = icon != null;
    final gradientIconButton = gradient && hasIcon && text.isEmpty;
    final onlyIconButton = (onlyIcon ?? false) && hasIcon && text.isEmpty;

    if (dialogButton ?? false) {
      if (dialogButtonType == DialogButtonType.buttonBlack) {
        return DialogButton.black(
          text: text,
          onPressed: onPressed,
          small: true,
        );
      } else {
        return DialogButton.white(
          text: text,
          onPressed: onPressed,
          small: true,
        );
      }
    } else if (gradientIconButton) {
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
      return GeneralPurposeButtonWithIcon(
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
      return GeneralPurposeButton(
        text: text,
        onPressed: onPressed,
      );
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static WidgetsFactory? of(BuildContext context) {
    final instance = context.findAncestorWidgetOfExactType<WidgetsFactory>();
    return instance;
  }

  @override
  ButtonFactory createSmallButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    bool gradient = false,
    bool isTextButton = false,
    bool? dialogButton,
    DialogButtonType? dialogButtonType,
    bool? onlyIcon,
    bool? outlined,
    bool? blurred,
  }) {
    final hasIcon = icon != null;
    if (dialogButton ?? false) {
      if (dialogButtonType == DialogButtonType.buttonBlack) {
        return DialogButton.black(
          text: text,
          onPressed: onPressed,
          small: true,
        );
      } else {
        return DialogButton.white(
          text: text,
          onPressed: onPressed,
          small: true,
        );
      }
    } else if ((outlined ?? false) && isTextButton) {
      return SmallOutlinedTextButton(
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
    return SmallGeneralPurposeButton(
      text: text,
      onPressed: onPressed,
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
