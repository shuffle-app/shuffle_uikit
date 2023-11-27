import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseAccountMark extends StatelessWidget {
  final IconData iconData;
  const BaseAccountMark({
    super.key,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ImageWidget(iconData: iconData);
  }
}
