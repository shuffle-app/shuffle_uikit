import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/colors_foundation.dart';

class InputStateColor extends MaterialStateColor {
  const InputStateColor() : super(0xFF000000);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return ColorsFoundation.solidGreyText;
    if (states.contains(MaterialState.error)) return ColorsFoundation.error;
    return Colors.white;
  }
}
