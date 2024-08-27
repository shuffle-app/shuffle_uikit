import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCustomChildContentUpdateWidget extends UiKitContentUpdateWidget {
  final Widget child;

  @override
  final double height;

  const UiKitCustomChildContentUpdateWidget({
    Key? key,
    required this.child,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: child,
    );
  }
}
