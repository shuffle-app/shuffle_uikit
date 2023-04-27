import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderRadiusFoundation {
  BorderRadiusFoundation._();

  static final all16 = const BorderRadius.all(Radius.circular(16));
  static final all24 = const BorderRadius.all(Radius.circular(24));
  static final all40 = const BorderRadius.all(Radius.circular(40));
  static final onlyTop40 = const BorderRadius.only(
    topLeft: Radius.circular(40),
    topRight: Radius.circular(40),
  );

  static final onlyTop24 = const BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );

  static final onlyBottom24 = const BorderRadius.only(
    bottomLeft: Radius.circular(24),
    bottomRight: Radius.circular(24),
  ).r;
  static final max = const BorderRadius.all(Radius.circular(9999));
}
