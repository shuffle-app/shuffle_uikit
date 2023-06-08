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

      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1.3,
        bgColor: theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )
        ..addScenario(
          'No message',
          UiKitMessageCardWithIcon(
            onPressed: () {},
            message: '',
            icon: ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
            ),
            layoutDirection: Axis.horizontal,
          ),
        )
        ..addScenario(
          'Long message',
          UiKitMessageCardWithIcon(
            onPressed: () {},
            message:
                'need to cool down a bit?  need to cool down a bit? need to cool down a bit? need to cool down a bit? need to cool down a bit? need to cool down a bit?',
            icon: ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
            ),
            layoutDirection: Axis.horizontal,
          ),
        )
        ..addScenario(
          'normal message',
          UiKitMessageCardWithIcon(
            onPressed: () {},
            message: 'need to cool down a bit?',
            icon: ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
            ),
            layoutDirection: Axis.horizontal,
          ),
        )
        ..addScenario(
          'Without Message and icon',
          UiKitMessageCardWithIcon(
            onPressed: () {},
            message: '',
            icon: null,
            layoutDirection: Axis.horizontal,
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
