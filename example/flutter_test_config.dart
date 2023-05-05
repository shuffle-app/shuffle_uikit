import 'dart:async';

import 'package:flutter/services.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await loadAppFonts();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  return testMain();
}
