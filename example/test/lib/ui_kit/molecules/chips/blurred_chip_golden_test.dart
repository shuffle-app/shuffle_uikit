import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';
import 'package:shuffle_uikit/ui_kit/molecules/chips/blurred_chip.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('Blurred Chip', () {
    testGoldens('Blurred Question Chip', (tester) async {
      final builder = GoldenBuilder.column(
          wrap: (child) =>  Center(
                  child: child,
              ))
        ..addScenario(
          'Like in stand',
          UiKitBlurredQuestionChip(
            label: 'how it works',
            onTap: () {},
          ),
        )
        ..addScenario(
          'Long text',
          UiKitBlurredQuestionChip(
            label: 'Great, to bad forgot to mention this on the website',
            onTap: () {},
          ),
        );

      final ThemeData theme = UiKitThemeFoundation.defaultTheme;

      await tester.pumpWidgetBuilder(
        ScreenUtilInit(
          builder: (BuildContext context, Widget? child) {
            return builder.build();
          },
        ),
        wrapper: materialAppWrapper(
          theme: theme,
        ),
      );

      await screenMatchesGolden(tester, 'blurred_chip');
    });
  });
}
