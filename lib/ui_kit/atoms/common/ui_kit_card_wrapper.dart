import 'package:flutter/material.dart';

class CardWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  const CardWrapper({
    Key? key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: width,
        height: height,
        padding: padding,
        child: child,
      ),
    );
  }
}
