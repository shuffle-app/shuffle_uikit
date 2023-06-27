import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('UiKitMessageCardWithIcon', () {
    ThemeData theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('UiKitMessageCardWithIcon', (tester) async {
      debugDisableShadows = false;

      final builder = DeviceBuilder(wrap: (child) => child)
        ..overrideDevicesForAllScenarios(devices: [
          Device.iphone11,
          Device.phone,
        ])
        ..addScenario(
          widget: Column(
            children: [
              UiKitMessageCardWithIcon(
                onPressed: () {},
                message: 'need to ',
                icon: ImageWidget(
                  svgAsset:
                      GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                ),
                layoutDirection: Axis.horizontal,
              ),
              UiKitMessageCardWithIcon(
                onPressed: () {},
                message: 'need to cool down',
                icon: ImageWidget(
                  svgAsset:
                      GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                ),
                layoutDirection: Axis.horizontal,
              ),
            ],
          ),
        );

      await tester.pumpWidgetBuilder(
        ScreenUtilInit(
            splitScreenMode: true,
            child: builder.build(),
            builder: (BuildContext context, Widget? child) =>
                StatefulBuilder(builder: (context, setState) {
                  return UiKitTheme(
                      onThemeUpdated: (theme) => setState(() => theme = theme),
                      child: Material(
                          child: Theme(
                        data: theme,
                        child: ListView(children: [
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal, child: child!)
                        ]),
                      )));
                })),
      );
      await screenMatchesGolden(tester, 'UiKitMessageCardWithIcon',
          autoHeight: true);
    });
  });
}
