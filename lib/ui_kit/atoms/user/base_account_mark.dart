import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseAccountMark extends StatelessWidget {
  final String iconLink;

  const BaseAccountMark({
    super.key,
    required this.iconLink,
  });

  @override
  Widget build(BuildContext context) {
    return ImageWidget(link: iconLink);
  }
}
