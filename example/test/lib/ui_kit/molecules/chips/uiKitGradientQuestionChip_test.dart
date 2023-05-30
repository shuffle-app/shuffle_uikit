import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('UiKit Gradient QuestionChip', () {
    ThemeData _theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('UiKit Gradient QuestionChip', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.column(
        bgColor: _theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )..addScenario(
          'Tell us more',
          const UiKitGradientQuestionChip(
            message: 'Tell us more',
          ),
        );

      await tester.pumpWidgetBuilder(ScreenUtilInit(
          designSize: const Size(414, 568),
          child: builder.build(),
          builder: (BuildContext context, Widget? child) =>
              StatefulBuilder(builder: (context, setState) {
                return UiKitTheme(
                    onThemeUpdated: (theme) => setState(() => _theme = theme),
                    child: Material(child: Theme(data: _theme, child: child!)));
              })));

      await screenMatchesGolden(tester, 'UiKitGradientQuestionChip_width414',
          autoHeight: true);
    });
  });
}
