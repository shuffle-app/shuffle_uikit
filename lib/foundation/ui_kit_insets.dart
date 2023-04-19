import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';

class EdgeInsetsFoundation {
  EdgeInsetsFoundation._();
  static final zero = 0.w;

  static double get all4 => 4.w;
  static double get all8 => 8.w;
  static double get all16 => 16.w;

  static double get horizontal16 => SpacingFoundation.horizontalSpacing16;
  static double get vertical16 => SpacingFoundation.verticalSpacing16;
  static double get horizontal12 => SpacingFoundation.horizontalSpacing12;
  static double get vertical12 => SpacingFoundation.verticalSpacing12;
  static double get vertical8 => SpacingFoundation.verticalSpacing8;
}
