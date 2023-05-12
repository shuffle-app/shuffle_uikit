import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizesFoundation {
  static Size get standartCalendarPopupSize => Size(266.w, 380.h);

  static BoxConstraints get minimumSizeForCommentPopup =>
      BoxConstraints(minWidth: 80.w, minHeight: 80.h);

  SizesFoundation._();
}
