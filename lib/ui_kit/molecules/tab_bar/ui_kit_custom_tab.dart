import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class UiKitCustomTab extends StatelessWidget {
  final String title;
  final double height;
  final bool isAutoSizeEnabled;
  final double maxFontSize;

  const UiKitCustomTab({
    Key? key,
    required this.title,
    this.height = 40,
    this.isAutoSizeEnabled = false,
    this.maxFontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: height,
      child: isAutoSizeEnabled
          ? AutoSizeText(
              title,
              maxFontSize: maxFontSize,
              maxLines: 1,
            )
          : Text(title),
    );
  }
}
