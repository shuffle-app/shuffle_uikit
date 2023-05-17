import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('Blurred Chip', () {
    ThemeData _theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('Blurred Question Chip', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.column(
        bgColor: _theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )
        ..addScenario(
          'Like in stand',
          const UiKitBlurredQuestionChip(
            label: 'how it\nworks',
          ),
        )
        ..addScenario(
          'Long text',
          const UiKitBlurredQuestionChip(
            label: 'how it works you will find on\nyour own way young padawan',
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
                            child: Theme(data: _theme, child: child!)));
                  }))
          //   },
          // ),
          // wrapper: materialAppWrapper(
          //   theme: theme,
          // ),
          );

      await screenMatchesGolden(tester, 'blurred_chip', autoHeight: true);
    });
  });
}
