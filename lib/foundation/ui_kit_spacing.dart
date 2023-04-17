import 'package:flutter/cupertino.dart';

class SpacingFoundation {
  SpacingFoundation._();

  //TODO: что будет на разных экранах? думаю стоит подключить screenUtil или что-то подобное чтобы примерно одинаково выглядело (кроме веба, там другая история конечно)
  static const horizontalSpace4 = SizedBox(width: 4);
  static const horizontalSpace8 = SizedBox(width: 8);
  static const horizontalSpace10 = SizedBox(width: 10);
  static const horizontalSpace12 = SizedBox(width: 12);
  static const horizontalSpace16 = SizedBox(width: 16);
  static const verticalSpace2 = SizedBox(height: 2);
  static const verticalSpace4 = SizedBox(height: 4);
  static const verticalSpace8 = SizedBox(height: 8);
  static const verticalSpace12 = SizedBox(height: 12);
  static const verticalSpace16 = SizedBox(height: 16);
  static const verticalSpace24 = SizedBox(height: 24);
}
