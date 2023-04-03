import 'package:flutter/material.dart';

abstract class UiKitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const UiKitButton({super.key, required this.onPressed});
}

class SomeButtonWithIcon extends UiKitButton {
  final Widget icon;

  const SomeButtonWithIcon({
    super.key,
    required super.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: icon);
  }
}

class SomeButtonWithText extends UiKitButton {
  final String text;

  const SomeButtonWithText({
    super.key,
    required super.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

class UiKitExampleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget child;

  UiKitExampleButton.text({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : child = Text(text);

  UiKitExampleButton.icon({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : text = '';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}
