import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseAccountMark extends StatelessWidget {
  final String iconLink;
  final Color? color;

  const BaseAccountMark({
    super.key,
    required this.iconLink,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ImageWidget(link: iconLink, color: color);
  }
}
