import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('Swiper Ad card', () {

    ThemeData _theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('Swiper Ad card', (tester) async {

      debugDisableShadows = false;

      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1.3,
          bgColor: _theme.scaffoldBackgroundColor,
          wrap: (child) =>child,
              )
        ..addScenario(
          'Like in stand',
          UiKitSwiperAdCard(
                title: '',
                subtitle: '',
                imageLink: Assets.images.png.mockAdBanner.path,
              ),
        )
        ..addScenario(
          'Long text',
          UiKitSwiperAdCard(
                title: 'Title',
                subtitle: '',
                imageLink: Assets.images.png.mockAdBanner.path,
              ),
        ) ..addScenario(
          'Without accent Message',
          UiKitSwiperAdCard(
                title: '',
                subtitle: 'Subtitle',
                imageLink: Assets.images.png.mockAdBanner.path,
              ),
        ) ..addScenario(
          'Without accent Message and additional info',
          UiKitSwiperAdCard(
                title: 'Title',
                subtitle: 'Subtitle',
                imageLink: Assets.images.png.mockAdBanner.path,
              ),
        );



      await tester.pumpWidgetBuilder(ScreenUtilInit(
              designSize: const Size(500, 1000),
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

      await screenMatchesGolden(tester, 'swiper_ad_card',autoHeight: true);
    });
  });
}
