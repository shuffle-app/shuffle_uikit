import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';
import 'package:shuffle_uikit/ui_kit/molecules/chips/blurred_chip.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('Blurred Chip', () {
    testGoldens('Blurred Question Chip', (tester) async {
      final builder = GoldenBuilder.column()
        ..addScenario(
          'Like in stand',
          const Center(
            child: BlurredQuestionChip(
              label: 'how it works',
            ),
          ),
        )
        ..addScenario(
          'Long text',
          const Center(
            child: BlurredQuestionChip(
              label: 'Great, to bad forgot to mention this on the website',
            ),
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
