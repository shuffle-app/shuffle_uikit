import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('UiKitIconHintCard', () {
    ThemeData theme = UiKitThemeFoundation.fallbackTheme;

    testGoldens('UiKitIconHintCard', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.column(
        bgColor: theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )
        ..addScenario(
            'Interests',
            UiKitIconHintCard(
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.dart,
              ),
              hint: 'your interests',
            ))
        ..addScenario(
            'Interests',
            UiKitIconHintCard(
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.sunClouds,
              ),
              hint: 'weather around',
            ))
        ..addScenario(
            'Interests',
            UiKitIconHintCard(
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.location,
              ),
              hint: 'your location',
            ));

      await tester.pumpWidgetBuilder(
        ScreenUtilInit(
            designSize: const Size(320, 568),
            child: builder.build(),
            builder: (BuildContext context, Widget? child) =>
                StatefulBuilder(builder: (context, setState) {
                  return UiKitTheme(
                      onThemeUpdated: (theme) => setState(() => theme = theme),
                      child:
                          Material(child: Theme(data: theme, child: child!)));
                })),
      );

      await screenMatchesGolden(tester, 'UiKitIconHintCard', autoHeight: true);
    });
  });
}
