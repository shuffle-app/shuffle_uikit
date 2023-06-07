import 'dart:io';

import 'package:testable_widgets_generator/testable_widgets_generator.dart'
    as testable_widgets_generator;

Future<void> main(List<String> arguments) async {
  print('start');

  final sourceFile = File(
      '../../lib/ui_kit/atoms/buttons/gradient_button_with_text_and_icon.dart');
  final sourceCode = await sourceFile.readAsString();

  var resultCode = testable_widgets_generator.wrapWidgetsChild(sourceCode);
  resultCode = testable_widgets_generator.wrapWidgetsChildren(resultCode);
  // resultCode = testable_widgets_generator.setClassNameIfNotChanged(
  //     resultCode, resultCode.length - 1);

  print(resultCode);

  final generatedFile = File(
      '../../example/lib/generated/ui_kit/atoms/buttons/gradient_button_with_text_and_icon.dart')
    ..createSync(recursive: true);
  print(generatedFile.absolute);
  generatedFile.writeAsStringSync(resultCode);
}
