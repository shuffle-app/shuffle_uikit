import 'dart:io';

import 'package:testable_widgets_generator/testable_widgets_generator.dart'
    as testable_widgets_generator;

Future<void> main(List<String> arguments) async {
  print('start');

  File('./source_files.txt').readAsLinesSync().forEach(
    (path) {
      testable_widgets_generator.generateForFile(path);
    },
  );
}
