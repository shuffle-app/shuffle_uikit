import 'package:example/generated/ui_kit/organisms/place/slider_place_card.dart';
import 'package:flutter/material.dart';

import 'package:shuffle_uikit/shuffle_uikit.dart';

class TestWidgetMapper {
  static getTestObject(Widget widget) {
    switch (widget.runtimeType) {
      case (SliderPlaceCard):
        return SliderPlaceCardWrapForTesting();
      default:
        return Text('No testable widget for this type');
    }
  }
}
