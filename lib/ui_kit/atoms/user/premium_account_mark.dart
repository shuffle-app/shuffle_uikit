import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PremiumAccountMark extends BaseAccountMark {
  PremiumAccountMark({Key? key})
      : super(
          key: key,
          iconLink: GraphicsFoundation.instance.svg.premiumAccountMark.path,
        );
}
