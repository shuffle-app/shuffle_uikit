import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class InputStateColor extends MaterialStateColor {
  const InputStateColor() : super(0xFFffffff);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return ColorsFoundation.darkNeutral900;
    if (states.contains(MaterialState.error)) return ColorsFoundation.error;
    return Colors.white;
  }
}
