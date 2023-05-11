import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// void main() {
//   group('Golden Builder', () {
//     testGoldens('Scenario Builder example', (tester) async {
//       final builder = GoldenBuilder.grid(
//         columns: 2,
//         widthToHeightRatio: 1,
//       )
//         ..addScenarioBuilder("Primary Color", (context) {
//           var color = Theme.of(context).colorScheme.primary;
//           return Container(
//             color: color,
//           );
//         })
//         ..addScenarioBuilder("Secondary Color", (context) {
//           var color = Theme.of(context).colorScheme.primary;
//           return Container(
//             color: color,
//           );
//         });
//       await tester.pumpWidgetBuilder(builder.build());
//       await screenMatchesGolden(tester, 'golden_builder_theme');
//     });
//
//     testGoldens('Column layout example', (tester) async {
//       await tester.pumpWidgetBuilder(
//         Center(
//             child: (GoldenBuilder.column()
//                   ..addScenario('red',
//                       Container(height: 50, width: 50, color: Colors.red))
//                   ..addScenario('green',
//                       Container(height: 50, width: 50, color: Colors.green))
//                   ..addScenario('blue',
//                       Container(height: 50, width: 50, color: Colors.blue)))
//                 .build()),
//         surfaceSize: const Size(100, 300),
//       );
//       await screenMatchesGolden(tester, 'golden_builder_column',
//           autoHeight: true);
//     });
//
//     testGoldens('Grid layout example', (tester) async {
//       await tester.pumpWidgetBuilder(
//         Center(
//             child: (GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
//                   ..addScenario('red',
//                       Container(height: 50, width: 50, color: Colors.red))
//                   ..addScenario('green',
//                       Container(height: 50, width: 50, color: Colors.green))
//                   ..addScenario('blue',
//                       Container(height: 50, width: 50, color: Colors.blue)))
//                 .build()),
//         surfaceSize: const Size(300, 300),
//       );
//       await screenMatchesGolden(tester, 'golden_builder_grid',
//           autoHeight: true);
//     });
//
//     testGoldens('TextScaleScenario', (tester) async {
//       await tester.pumpWidgetBuilder(
//         Center(
//             child: (GoldenBuilder.column()
//                   ..addTextScaleScenario('small', const Text('text'),
//                       textScaleFactor: 1.0)
//                   ..addTextScaleScenario('medium', const Text('text'),
//                       textScaleFactor: 2.0))
//                 .build()),
//         surfaceSize: const Size(100, 300),
//       );
//       await screenMatchesGolden(tester, 'golden_builder_textscale',
//           autoHeight: true);
//     });
//   });
// }
