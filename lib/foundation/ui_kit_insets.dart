import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class EdgeInsetsFoundation {
  EdgeInsetsFoundation._();
  static final zero = 0.w;

  static double get all4 => 4.sp;
  static double get all8 => 8.sp;
  static double get all12 => 12.sp;
  static double get all16 => 16.sp;
  static double get all20 => 20.sp;

  static double get horizontal16 => SpacingFoundation.horizontalSpacing16;
  static double get horizontal20 => SpacingFoundation.horizontalSpacing20;
  static double get vertical16 => SpacingFoundation.verticalSpacing16;
  static double get horizontal12 => SpacingFoundation.horizontalSpacing12;
  static double get vertical12 => SpacingFoundation.verticalSpacing12;
  static double get vertical8 => SpacingFoundation.verticalSpacing8;
  static double get vertical4 => SpacingFoundation.verticalSpacing4;
}
