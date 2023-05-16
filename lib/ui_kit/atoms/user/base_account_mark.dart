import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseAccountMark extends StatelessWidget {
  final SvgGenImage svgAsset;
  const BaseAccountMark({
    super.key,
    required this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return ImageWidget(svgAsset: svgAsset);
  }
}
