import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit/atoms/inputs/input_field.dart';

class UiKitInputFieldNoFill extends UiKitInputField {
  const UiKitInputFieldNoFill({
    Key? key,
    required super.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
