import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('TitledAccentInfo', () {
    ThemeData theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('TitledAccentInfo', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1.3,
        bgColor: theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )
        ..addScenario(
          'normal text',
          const TitledAccentInfo(
            title: 'Don’t miss it',
            info: '11:00 am, November 20  ',
          ),
        )
        ..addScenario(
          'Long title',
          const TitledAccentInfo(
            title:
                'Don’t miss it Don’t miss it Don’t miss it Don’t miss it  Don’t miss it  Don’t miss it  Don’t miss it   Don’t miss it  Don’t miss it',
            info: '11:00 am, November 20    ',
          ),
        )
        ..addScenario(
          'long info',
          const TitledAccentInfo(
            title: 'Don’t miss it',
            info:
                '11:00 am, November 20    golden was used in the test "TitledAccentInfo TitledAccentInfo 11:00 am, November 20    golden was used in the test "TitledAccentInfo TitledAccentInfo 11:00 am, November 20    golden was used in the test "TitledAccentInfo TitledAccentInfo 11:00 am, November 20    golden was used in the test "TitledAccentInfo TitledAccentInfo',
          ),
        );

      await tester.pumpWidgetBuilder(ScreenUtilInit(
          designSize:  Size(450, 568),
          child: builder.build(),
          builder: (BuildContext context, Widget? child) =>
              StatefulBuilder(builder: (context, setState) {
                return UiKitTheme(
                    onThemeUpdated: (theme) => setState(() => theme = theme),
                    child: Material(child: Theme(data: theme, child: child!)));
              })));

      await screenMatchesGolden(
          tester, 'TitledAccentInfo_width450',
          autoHeight: true);
    });
  });
}
