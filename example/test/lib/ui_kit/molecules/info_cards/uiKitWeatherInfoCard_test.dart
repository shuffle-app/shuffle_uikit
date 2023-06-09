import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('UiKitWeatherInfoCard', () {
    ThemeData theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('UiKitWeatherInfoCard', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1.3,
        bgColor: theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )
        ..addScenario(
          'No temp and weatherType',
          const Expanded(
            child: UiKitWeatherInfoCard(
              temperature: '',
              weatherType: '',
            ),
          ),
        )
        ..addScenario(
          'With temp and no weather type',
          const Expanded(
            child: UiKitWeatherInfoCard(
              temperature: '32',
              weatherType: '',
            ),
          ),
        )
        ..addScenario(
          'with temp and weatherType',
          const Expanded(
            child: UiKitWeatherInfoCard(
              temperature: '32',
              weatherType: 'Sunny',
            ),
          ),
        );

      await tester.pumpWidgetBuilder(SingleChildScrollView(
        child: ScreenUtilInit(
            designSize: const Size(300, 568),
            child: builder.build(),
            builder: (BuildContext context, Widget? child) =>
                StatefulBuilder(builder: (context, setState) {
                  return UiKitTheme(
                      onThemeUpdated: (theme) => setState(() => theme = theme),
                      child:
                          Material(child: Theme(data: theme, child: child!)));
                })),
      ));

      await screenMatchesGolden(tester, 'UiKitWeatherInfoCard',
          autoHeight: true);
    });
  });
}
