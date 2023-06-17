import 'dart:io';

import 'package:testable_widgets_generator/testable_widgets_generator.dart'
    as testable_widgets_generator;
import 'package:testable_widgets_generator/testable_widgets_mapper_generator.dart'
    as mapper_generator;

Future<void> main(List<String> arguments) async {
  var mapperCode = mapper_generator.createBeginning();

  File('./source_files.txt').readAsLinesSync().forEach(
    (path) {
      print(path);
      testable_widgets_generator.generateForFile(path);
      mapperCode = mapper_generator.addImport(path, mapperCode);
      mapperCode = mapper_generator.addCase(mapperCode, path);
    },
  );

  mapperCode = mapper_generator.createEnding(mapperCode);

  mapper_generator.generateMapper(mapperCode);
}
