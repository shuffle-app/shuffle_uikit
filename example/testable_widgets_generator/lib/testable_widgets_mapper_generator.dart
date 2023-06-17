import 'dart:io';

String addImport(String source, String result) {
  final actualImport =
      'import \'package:example/generated/${source.substring(4)}\';';
  return '$actualImport\n$result';
}

String createBeginning() {
  return '''
import 'package:flutter/material.dart';

import 'package:shuffle_uikit/shuffle_uikit.dart';

class TestWidgetMapper {
  static getTestObject(Widget widget) {
    switch (widget.runtimeType) {
''';
}

String createEnding(String result) {
  return '''$result
      default:
        return const Center(child: Text('No testable widget for this type'));
    }
  }
}
''';
}

String addCase(String result, String path) {
  final classNames = getClassNames(path);
  var c = '';
  for (var name in classNames) {
    c = '''
  case ($name):
    return ${name}WrapForTesting();
''';
    result = '$result\n$c';
  }
  return result;
}

Future<void> generateMapper(String source) async {
  final generatedFile =
      File('../../example/lib/generated/test_widget_mapper.dart')
        ..createSync(recursive: true);
  generatedFile.writeAsStringSync(source);
}

List<String> getClassNames(String path) {
  final source = File('../../$path').readAsStringSync();
  final classNames = List<String>.empty(growable: true);
  var i = 0;
  while (i < path.length) {
    i = source.indexOf('class ', i) + 6;
    classNames.add(source.substring(i).split(' ').first);
  }

  return classNames;
}
