import 'package:flutter/material.dart';

abstract class UiKitContentUpdateWidget extends StatelessWidget {
  final String? title;
  final String? iconLink;
  final IconData? iconData;
  final String? leadingImageUrl;
  final String? subtitle;
  final Widget? customChild;

  const UiKitContentUpdateWidget({
    super.key,
    this.title,
    this.iconLink,
    this.leadingImageUrl,
    this.customChild,
    this.subtitle,
    this.iconData,
  });

  double get height;

  @override
  Widget build(BuildContext context);
}
