import 'package:flutter/material.dart';

class BorderRadiusFoundation {
  BorderRadiusFoundation._();

  static const all24 = BorderRadius.all(Radius.circular(24));
  static const onlyBottom24 = BorderRadius.only(
    bottomLeft: Radius.circular(24),
    bottomRight: Radius.circular(24),
  );
  static const max = BorderRadius.all(Radius.circular(9999));
}
