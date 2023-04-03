import 'package:flutter/material.dart';
import 'package:shuffle_uikit/tokens/ui_kit_border_radius.dart';
import 'package:shuffle_uikit/tokens/ui_kit_gradient_borders.dart';
import 'package:shuffle_uikit/tokens/ui_kit_insets.dart';

class InterestChip extends StatelessWidget {
  final String interest;
  final bool isSelected;

  const InterestChip({
    Key? key,
    required this.interest,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UiKitEdgeInsets.symmetricH12V6,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: UiKitBorderRadius.max,
        border: isSelected ? UiKitGradientBorders.gradientDefault : Border.all(color: Colors.white, width: 2),
      ),
      child: Text(
        interest,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
