import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AccountMark extends StatelessWidget {
  final SvgGenImage svgAsset;
  const AccountMark({
    super.key,
    required this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return ImageWidget(svgAsset: svgAsset);
  }
}

class PremiumAccountMark extends AccountMark {
  PremiumAccountMark({Key? key})
      : super(
          key: key,
          svgAsset: Assets.images.svg.premiumAccountMark,
        );
}

class ProAccountMark extends AccountMark {
  ProAccountMark({Key? key})
      : super(
          key: key,
          svgAsset: Assets.images.svg.proAccountMark,
        );
}

class InfluencerAccountMark extends AccountMark {
  InfluencerAccountMark({Key? key})
      : super(
          key: key,
          svgAsset: Assets.images.svg.influencerAccountMark,
        );
}
