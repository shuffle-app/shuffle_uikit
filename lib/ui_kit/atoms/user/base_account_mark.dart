import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseAccountMark extends StatelessWidget {
  final String iconLink;
  final Color? color;
  final double? width;

  const BaseAccountMark({
    super.key,
    required this.iconLink,
    this.color,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      link: iconLink,
      color: color,
      width: width,
      fit: BoxFit.fill,
    );
  }
}
