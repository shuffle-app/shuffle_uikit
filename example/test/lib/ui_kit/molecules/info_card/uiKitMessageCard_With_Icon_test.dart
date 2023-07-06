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
            mainAxisSize: MainAxisSize.min,
            children: [
              UiKitMessageCardWithIcon(
                onPressed: () {},
                message: 'Need to cool down ',
                icon: ImageWidget(
                  svgAsset:
                      GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                ),
                layoutDirection: Axis.horizontal,
              ),
              UiKitMessageCardWithIcon(
                onPressed: () {},
                message: ' ',
                icon: ImageWidget(
                  svgAsset:
                      GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                ),
                layoutDirection: Axis.horizontal,
              ),
              UiKitMessageCardWithIcon(
                onPressed: () {},
                message: 'need to cool down ',
                icon: ImageWidget(
                  svgAsset:
                      GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                ),
                layoutDirection: Axis.vertical,
              ),
               UiKitMessageCardWithIcon(
                onPressed: () {},
                message: '',
                icon: ImageWidget(
                  svgAsset:
                      GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                ),
                layoutDirection: Axis.vertical,
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
                        child: child!,
                      )));
                })),
      );
      // await screenMatchesGolden(tester, 'UiKitMessageCardWithIcon',
      //    autoHeight: false);
      await multiScreenGolden(tester, '', autoHeight: true, devices: [
        const Device(
          name: '2 devices ',
          size: Size(1100, 1000),
        ),
      ]);
    });
  });
}
