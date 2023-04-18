import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EdgeInsetsFoundation {
  EdgeInsetsFoundation._();

  static final all4 = const EdgeInsets.all(4.0).w;
  static final all8 = const EdgeInsets.all(8.0).w;
  static final all16 = const EdgeInsets.all(16.0).w;

  static final horizontal16 = const EdgeInsets.symmetric(horizontal: 16.0).w;
  static final vertical16 = const EdgeInsets.symmetric(vertical: 16.0).h;

  static final symmetricH12V6 = const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0).w;
  static final symmetricH16V12 = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0).w;
}
