import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class InputStateColor extends WidgetStateColor {
  const InputStateColor() : super(0xFFffffff);

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return ColorsFoundation.darkNeutral900;
    if (states.contains(WidgetState.error)) return ColorsFoundation.error;

    return Colors.white;
  }
}
