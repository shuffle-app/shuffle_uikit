import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/images_foundation.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/tokens/assets.gen.dart';

class PremiumAccountMark extends StatelessWidget {
  const PremiumAccountMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageWidget(svgAsset: Assets.images.svg.premiumAccountMark);
  }
}

class ProAccountMark extends StatelessWidget {
  const ProAccountMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageWidget(svgAsset: Assets.images.svg.proAccountMark);
  }
}

class InfluencerAccountMark extends StatelessWidget {
  const InfluencerAccountMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageWidget(svgAsset: Assets.images.svg.influencerAccountMark);
  }
}
