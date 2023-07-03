import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SpacingFoundation {
  static double get zero => 0.sp;

  static double get horizontalSpacing2 => 2.w;

  static double get horizontalSpacing4 => 4.w;

  static double get horizontalSpacing6 => 6.w;

  static double get horizontalSpacing8 => 8.w;

  static double get horizontalSpacing10 => 10.w;

  static double get horizontalSpacing12 => 12;

  static double get horizontalSpacing16 => 16;

  static double get horizontalSpacing20 => 20;

  static double get horizontalSpacing24 => 24;

  static double get horizontalSpacing32 => 32;

  static double get verticalSpacing2 => 2.h;

  static double get verticalSpacing4 => 4.h;

  static double get verticalSpacing6 => 6.h;

  static double get verticalSpacing8 => 8.h;

  static double get verticalSpacing10 => 10.h;

  static double get verticalSpacing12 => 12;

  static double get verticalSpacing14 => 14.h;

  static double get verticalSpacing16 => 16;

  static double get verticalSpacing20 => 20;

  static double get verticalSpacing24 => 24;

  static Widget get horizontalSpace2 => horizontalSpacing2.horizontalSpace;

  static Widget get horizontalSpace4 => horizontalSpacing4.horizontalSpace;

  static Widget get horizontalSpace8 => horizontalSpacing8.horizontalSpace;

  static Widget get horizontalSpace10 => horizontalSpacing10.horizontalSpace;

  static Widget get horizontalSpace12 => horizontalSpacing12.widthBox;

  static Widget get horizontalSpace16 => horizontalSpacing16.widthBox;

  static Widget get horizontalSpace24 => horizontalSpacing24.widthBox;

  static Widget get verticalSpace2 => verticalSpacing2.verticalSpace;

  static Widget get verticalSpace4 => verticalSpacing4.verticalSpace;

  static Widget get verticalSpace8 => verticalSpacing8.verticalSpace;

  static Widget get verticalSpace12 => verticalSpacing12.heightBox;

  static Widget get verticalSpace14 => verticalSpacing14.heightBox;

  static Widget get verticalSpace16 => verticalSpacing16.heightBox;

  static Widget get verticalSpace24 => verticalSpacing24.heightBox;

  static Widget get bottomNavigationBarSpacing => kBottomNavigationBarHeight.verticalSpace;

  SpacingFoundation._();
}
