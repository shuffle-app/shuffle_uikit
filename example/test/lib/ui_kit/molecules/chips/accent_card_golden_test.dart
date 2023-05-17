import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('Blurred Chip', () {

    ThemeData _theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('Blurred Question Chip', (tester) async {
      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1.3,
          bgColor: _theme.scaffoldBackgroundColor,
          wrap: (child) =>child,
              )
        ..addScenario(
          'Like in stand',
          UiKitAccentCard(
            title: 'Ballooning festival',
            additionalInfo: '22-23 March',
            accentMessage: 'Don’t miss',
            image: ImageWidget(
              rasterAsset: GraphicsFoundation.instance.png.balloons,
              fit: BoxFit.cover,
            ),
            onPressed: () {},
          ),
        )
        ..addScenario(
          'Long text',
          UiKitAccentCard(
            title: 'Ballooning festival with Eminem, Snoop Dog, Ice Cube and Juicy Jay!',
            additionalInfo: '22-23 March only',
            accentMessage: 'Don’t miss that great event!',
            image: ImageWidget(
              rasterAsset: GraphicsFoundation.instance.png.balloons,
              fit: BoxFit.cover,
            ),
            onPressed: () {},
          ),
        ) ..addScenario(
          'Without accent Message',
          UiKitAccentCard(
            title: 'Ballooning festival',
            additionalInfo: '22-23 March only',
            accentMessage: '',
            image: ImageWidget(
              rasterAsset: GraphicsFoundation.instance.png.balloons,
              fit: BoxFit.cover,
            ),
            onPressed: () {},
          ),
        ) ..addScenario(
          'Without accent Message and additional info',
          UiKitAccentCard(
            title: 'Ballooning festival',
            additionalInfo: '',
            accentMessage: '',
            image: ImageWidget(
              rasterAsset: GraphicsFoundation.instance.png.balloons,
              fit: BoxFit.cover,
            ),
            onPressed: () {},
          ),
        );



      await tester.pumpWidgetBuilder(ScreenUtilInit(
              designSize: const Size(320, 568),
              child: builder.build(),
              builder: (BuildContext context, Widget? child) =>
                  StatefulBuilder(builder: (context, setState) {
                    return UiKitTheme(
                        onThemeUpdated: (theme) =>
                            setState(() => _theme = theme),
                        child: Material(
                            child:
                                Theme(data: _theme, child: child!)));
                  }))
          //   },
          // ),
          // wrapper: materialAppWrapper(
          //   theme: theme,
          // ),
          );

      await screenMatchesGolden(tester, 'blurred_chip',autoHeight: true);
    });
  });
}
