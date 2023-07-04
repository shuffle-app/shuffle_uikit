import 'dart:io';

import 'package:golden_test_image_copier/golden.dart';

void main() async {
  final moleculesCommonPath = 'test/lib/ui_kit/molecules';

  final moleculesCommonDir = Directory('../$moleculesCommonPath');
  final List<Directory> moleculeSpecifiedDirs = await moleculesCommonDir
      .list()
      .where((event) => event is Directory)
      .map((event) => event as Directory)
      .toList();

  for (final dir in moleculeSpecifiedDirs) {
    final golden = Golden(path: dir.path);


    print(golden.toString());
    golden.copyToAssets();
  }
}
