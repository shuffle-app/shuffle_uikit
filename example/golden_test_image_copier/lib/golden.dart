import 'dart:io';

class Golden {
  Golden({required this.path}) {
    masterImage = Directory('$path/goldens').listSync().first.path;

    final failures = Directory('$path/failures');
    if (failures.existsSync()) {
      isSuccessful = false;

      final images = failures.listSync().toList();

      testImage = images
          .firstWhere((element) => element.path.contains('testImage'))
          .path;
      maskedDiff = images
          .firstWhere((element) => element.path.contains('maskedDiff'))
          .path;
      isolatedDiff = images
          .firstWhere((element) => element.path.contains('isolatedDiff'))
          .path;
    } else {
      isSuccessful = true;
    }
  }

  String path;
  late String masterImage;
  late bool isSuccessful;

  String? testImage;
  String? maskedDiff;
  String? isolatedDiff;

  String copiedFilesPath = '../assets/goldens';

  String get simplePath => path.split('/').last;

  @override
  String toString() {
    return 'path: $path\nisSuccessful: $isSuccessful\nmasterImage: $masterImage\ntestImage: $testImage\nmaskedDiff: $maskedDiff\nisolatedDiff: $isolatedDiff';
  }

  void copyToAssets() {
    // final dir = Directory('$copiedFilesPath/$simplePath');
    // if (!dir.existsSync()) {
    //   dir.createSync(recursive: true);
    // }
    final dir = Directory('$copiedFilesPath');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    File(masterImage).copy('$copiedFilesPath/${simplePath}_master.png');

    if (!isSuccessful) {
      File(testImage!).copy('$copiedFilesPath/${simplePath}_testImage.png');
      File(isolatedDiff!).copy('$copiedFilesPath/${simplePath}_isolatedDiff.png');
      File(maskedDiff!).copy('$copiedFilesPath/${simplePath}_maskedDiff.png');
    }
  }
}
