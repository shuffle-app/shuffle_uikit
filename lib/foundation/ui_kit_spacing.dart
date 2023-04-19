import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpacingFoundation {
  SpacingFoundation._();

  static final horizontalSpacing4 = 4.w;
  static final horizontalSpacing8 = 8.w;
  static final horizontalSpacing10 = 10.w;
  static final horizontalSpacing12 = 12.w;
  static final horizontalSpacing16 = 16.w;
  static final verticalSpacing2 = 2.h;
  static final verticalSpacing4 = 4.h;
  static final verticalSpacing8 = 8.h;
  static final verticalSpacing12 = 12.h;
  static final verticalSpacing16 = 16.h;
  static final verticalSpacing24 = 24.h;

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
