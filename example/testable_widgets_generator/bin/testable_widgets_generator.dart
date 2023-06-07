import 'dart:io';

import 'package:testable_widgets_generator/testable_widgets_generator.dart'
    as testable_widgets_generator;
// import 'package:path/path.dart' as path;

Future<void> main(List<String> arguments) async {
  print('start');

  final sourceFile = File('../../lib/ui_kit/atoms/app_bar/app_bar_title.dart');
  final sourceCode = await sourceFile.readAsString();
  // print(sourceCode);
  var resultCode = testable_widgets_generator.wrapWidgetsChild(sourceCode);
  resultCode = testable_widgets_generator.wrapWidgetsChildren(resultCode);
  print(resultCode);

  // Directory('../lib/generated').createSync();
  final generatedFile =
      File('../../example/lib/generated/ui_kit/atoms/app_bar/app_bar_title.dart')
        ..createSync(recursive: true);
  generatedFile.writeAsStringSync(resultCode);
}
