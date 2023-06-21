import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('UiKit Gradient QuestionChip', () {
    ThemeData theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('UiKit Gradient QuestionChip', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.column(
        bgColor: theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )..addScenario(
          'Tell us more',
          const UiKitGradientQuestionChip(
            message: 'Tell us more Tell us more Tell us more Tell us moreTell us more Tell us more   Tell us more',
          ),
        );

      await tester.pumpWidgetBuilder(ScreenUtilInit(
          designSize: const Size(800, 568),
          child: builder.build(),
          builder: (BuildContext context, Widget? child) =>
              StatefulBuilder(builder: (context, setState) {
                return UiKitTheme(
                    onThemeUpdated: (theme) => setState(() => theme = theme),
                    child: Material(child: Theme(data: theme, child: child!)));
              })));

      await screenMatchesGolden(tester, 'UiKitGradientQuestionChip_200_no_content',
          autoHeight: true);
    });
  });
}