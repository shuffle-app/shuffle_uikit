import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class WidgetsAbstractFactory {
  ButtonFactory createButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    double? height,
    bool gradient = false,
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
// todo обсудить как сделать фабрику для инпутов, где есть стейт
// abstract class InputFieldFactory {
//   Widget build(BuildContext context);
// }

class WidgetsFactory extends InheritedWidget implements WidgetsAbstractFactory {
  const WidgetsFactory({required super.child, super.key});

  @override
  ButtonFactory createButton({
    required String text,
    VoidCallback? onPressed,
    Widget? icon,
    Color? color,
    double? height,
    bool gradient = false,
  }) {
    final iconedButton = icon != null;
    if (gradient && !iconedButton) {
      return GradientButton(
        text: text,
        onPressed: onPressed,
      );
    } else if (iconedButton && gradient) {
      return GradientButtonWithIcon(
        text: text,
        icon: icon,
        onPressed: onPressed,
      );
    } else if (iconedButton && !gradient) {
      return GeneralPurposeButtonWithIcon(
        text: text,
        onPressed: onPressed,
        icon: icon,
        color: color,
        height: height,
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
