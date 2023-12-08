import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UiKitShimmerProgressIndicator extends StatelessWidget {
  final Widget child;
  final Gradient gradient;

  const UiKitShimmerProgressIndicator({
    Key? key,
    required this.child,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(gradient: gradient, child: child);
  }
}
