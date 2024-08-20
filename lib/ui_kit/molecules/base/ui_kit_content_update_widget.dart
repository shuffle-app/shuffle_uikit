import 'package:flutter/material.dart';

abstract class UiKitContentUpdateWidget extends StatelessWidget {
  final String? title;
  final String? icon;
  final String? leadingImageUrl;
  final String? subtitle;
  final Widget? customChild;

  const UiKitContentUpdateWidget({
    Key? key,
    this.title,
    this.icon,
    this.leadingImageUrl,
    this.customChild,
    this.subtitle,
  }) : super(key: key);

  double get height;

  @override
  Widget build(BuildContext context);
}
