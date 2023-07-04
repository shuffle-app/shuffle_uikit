import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DefaultImageErrorWidget extends StatelessWidget {
  const DefaultImageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsFoundation.darkNeutral500.withOpacity(0.4),
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorsFoundation.darkNeutral400,
        ),
        child: ImageWidget(
          svgAsset: GraphicsFoundation.instance.svg.exclamation,
          color: ColorsFoundation.darkNeutral900,
        ).paddingAll(EdgeInsetsFoundation.all8),
      ).paddingAll(EdgeInsetsFoundation.all8),
    );
  }
}
