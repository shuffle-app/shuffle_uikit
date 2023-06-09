import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('UiKitMetricsCard', () {
    ThemeData theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('UiKitMetricsCard', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1.3,
        bgColor: theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )
        ..addScenario(
          'No title,value and unit',
          Expanded(
            child: UiKitMetricsCard(
              title: '',
              value: '',
              unit: '',
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.fireWhite,
              ),
            ),
          ),
        )
        ..addScenario(
          'With title ,value and unit',
          Expanded(
            child: UiKitMetricsCard(
              title: 'Burned today',
              value: '439',
              unit: 'kCal',
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.fireWhite,
              ),
            ),
          ),
        )
        ..addScenario(
          'with long title',
          Expanded(
            child: UiKitMetricsCard(
              title: 'Burned today Burned today Burned today   Burned today   Burned today   Burned today    Burned today    Burned today   Burned today    Burned today    Burned today    Burned today   Burned today   Burned today   Burned today   Burned today   Burned today  Burned today    Burned today   Burned today   Burned today   Burned today',
              value: '439',
              unit: 'kCal',
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.fireWhite,
              ),
            ),
          ),
        )
        ..addScenario(
          'With long value',
          Expanded(
            child: UiKitMetricsCard(
              title: 'Burned today',
              value: '439532452345234532452345234523523452345234523452345234523452345342523452345234523452345342',
              unit: 'kCal',
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.fireWhite,
              ),
            ),
          ),
        );

      await tester.pumpWidgetBuilder(ScreenUtilInit(
          designSize: const Size(320, 568),
          child: builder.build(),
          builder: (BuildContext context, Widget? child) =>
              StatefulBuilder(builder: (context, setState) {
                return UiKitTheme(
                    onThemeUpdated: (theme) => setState(() => theme = theme),
                    child: Material(child: Theme(data: theme, child: child!)));
              })));

      await screenMatchesGolden(tester, 'UiKitMessageCardWithIcon',
          autoHeight: true);
    });
  });
}
