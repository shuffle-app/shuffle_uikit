import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('UiKitTagsWidget', () {
    ThemeData theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('UiKitTagsWidget', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.grid(
        columns: 3,
        widthToHeightRatio: 2,
        bgColor: theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )
        ..addScenario(
          'UiKitTagsWidget',
          UiKitTagWidget(
            title: 'Club',
            icon: Assets.images.svg.cocktail.path,
          ),
        )
        ..addScenario(
          'UiKitTagsWidget',
          UiKitTagWidget(
            title: 'Club',
            icon: Assets.images.svg.cocktail.path,
          ),
        )
        ..addScenario(
          'UiKitTagsWidget',
          UiKitTagWidget(
            title: 'Club',
            icon: Assets.images.svg.cocktail.path,
          ),
        );

      await tester.pumpWidgetBuilder(ScreenUtilInit(
          designSize: const Size(414, 800),
          child: builder.build(),
          builder: (BuildContext context, Widget? child) =>
              StatefulBuilder(builder: (context, setState) {
                return UiKitTheme(
                    onThemeUpdated: (theme) => setState(() => theme = theme),
                    child: Material(child: Theme(data: theme, child: child!)));
              })));

      await screenMatchesGolden(tester, 'UiKitTagsWidget_width414_3cards',
          autoHeight: true);
    });
  });
}
