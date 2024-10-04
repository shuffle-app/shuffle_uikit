import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class IconMatcher {
  static IconData? matchSvgToIcon(String svgPath) {
    final svgName = svgPath.split('/').last.split('.').first.replaceAll('-', '').replaceAll('_', '');

    if (svgName == 'default') return ShuffleUiKitIcons.logo;

    switch (svgName) {

      default:
        return null;
    }
  }
}
