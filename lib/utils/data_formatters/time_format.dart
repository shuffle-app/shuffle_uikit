import 'package:flutter/material.dart';

String normalizedTi(TimeOfDay? time) {
  if(time == null) return 'nn';

  return '${leadingZeros(time.hour)}:${leadingZeros(time.minute)} ${time.period.name}';
}

String leadingZeros(int number){
  return number.toString().padLeft(2, '0');
}