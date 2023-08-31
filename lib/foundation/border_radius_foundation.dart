import 'package:flutter/material.dart';

class BorderRadiusFoundation {
  static BorderRadius get all4 => const BorderRadius.all(Radius.circular(4));
  static BorderRadius get all8 => const BorderRadius.all(Radius.circular(8));
  static BorderRadius get all10 => const BorderRadius.all(Radius.circular(10));
  static BorderRadius get all12 => const BorderRadius.all(Radius.circular(12));
  static BorderRadius get all16 => const BorderRadius.all(Radius.circular(16));
  static BorderRadius get all20 => const BorderRadius.all(Radius.circular(20));
  static BorderRadius get all24 => const BorderRadius.all(Radius.circular(24));
  static BorderRadius get all28 => const BorderRadius.all(Radius.circular(28));
  static BorderRadius get all32 => const BorderRadius.all(Radius.circular(32));
  static BorderRadius get all40 => const BorderRadius.all(Radius.circular(40));
  static BorderRadius get onlyTop40 => const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      );

  static BorderRadius get onlyTop24 => const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      );

  static BorderRadius get onlyBottom24 => const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      );

  static BorderRadius get onlyLeft24 => const BorderRadius.only(
        topLeft: Radius.circular(24),
        bottomLeft: Radius.circular(24),
      );

  static BorderRadius get zero => BorderRadius.zero;

  static BorderRadius get max => const BorderRadius.all(Radius.circular(9999));

  BorderRadiusFoundation._();
}
