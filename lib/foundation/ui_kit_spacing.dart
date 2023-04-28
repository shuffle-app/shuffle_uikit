import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpacingFoundation {
  SpacingFoundation._();

  static double get horizontalSpacing4 => 4.w;
  static double get horizontalSpacing8 => 8.w;
  static double get horizontalSpacing10 => 10.w;
  static double get horizontalSpacing12 => 12.w;
  static double get horizontalSpacing16 => 16.w;
  static double get horizontalSpacing20 => 20.w;
  static double get horizontalSpacing24 => 24.w;
  static double get verticalSpacing2 => 2.h;
  static double get verticalSpacing4 => 4.h;
  static double get verticalSpacing8 => 8.h;
  static double get verticalSpacing12 => 12.h;
  static double get verticalSpacing16 => 16.h;
  static double get verticalSpacing24 => 24.h;

  static Widget get horizontalSpace4 => horizontalSpacing4.horizontalSpace;
  static Widget get horizontalSpace8 => horizontalSpacing8.horizontalSpace;
  static Widget get horizontalSpace10 => horizontalSpacing10.horizontalSpace;
  static Widget get horizontalSpace12 => horizontalSpacing12.horizontalSpace;
  static Widget get horizontalSpace16 => horizontalSpacing16.horizontalSpace;
  static Widget get verticalSpace2 => verticalSpacing2.verticalSpace;
  static Widget get verticalSpace4 => verticalSpacing4.verticalSpace;
  static Widget get verticalSpace8 => verticalSpacing8.verticalSpace;
  static Widget get verticalSpace12 => verticalSpacing12.verticalSpace;
  static Widget get verticalSpace16 => verticalSpacing16.verticalSpace;
  static Widget get verticalSpace24 => verticalSpacing24.verticalSpace;
}
