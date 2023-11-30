import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProAccountMark extends BaseAccountMark {
  ProAccountMark({Key? key})
      : super(
          key: key,
          iconLink: GraphicsFoundation.instance.svg.proAccountMark.path,
        );
}
