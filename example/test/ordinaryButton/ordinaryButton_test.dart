import 'package:example/presentation/ui/dialog_testings/dialog_testing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('OrdinaryButton', () {
    ThemeData _theme = UiKitThemeFoundation.fallbackTheme;

    testGoldens('OrdinaryButton', (tester) async {
      debugDisableShadows = false;

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletLandscape,
          Device.tabletPortrait
        ])
        ..addScenario(
          widget: OrdinaryButton(
            text: 'OrdinaryButton',
            onPressed: () => showUiKitCalendarDialog,
          ),
          name: 'OrdinaryButton',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(
        tester,
        'OrdinaryButton',
      );
    });
  });
}
