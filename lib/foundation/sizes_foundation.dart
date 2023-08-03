import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizesFoundation {
  static Size get standartCalendarPopupSize => Size(266.w, 380.h);
  static Size get webCalendarPopupSize => Size(300, 0.5.sh);

  static BoxConstraints get minimumSizeForCommentPopup => BoxConstraints(minWidth: 80.w, minHeight: 80.h);

  static double get screenHeight => 1.sh;

  static double get screenWidth => 1.sw;

  SizesFoundation._();
}
