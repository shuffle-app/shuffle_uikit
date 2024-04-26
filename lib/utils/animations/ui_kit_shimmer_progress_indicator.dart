import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shuffle_uikit/foundation/colors_foundation.dart';

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
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Colors.white,
      period: const Duration(milliseconds: 1000),
      highlightColor: ColorsFoundation.gradientGreyLight3,
      child: child,
    );
  }
}
