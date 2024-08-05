import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/border_radius_foundation.dart';

class UiKitRoundedDivider extends StatelessWidget {
  final double? thickness;
  final double? height;

  const UiKitRoundedDivider({Key? key, this.thickness, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusFoundation.max,
      child: Divider(
        thickness: thickness,
        height: height,
      ),
    );
  }
}
