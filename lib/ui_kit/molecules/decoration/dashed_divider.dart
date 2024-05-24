import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  final Color color;
  final double availableWidth;

  const DashedDivider({
    Key? key,
    required this.color,
    required this.availableWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        availableWidth ~/ 4,
        (index) => Container(
          width: 1,
          height: 1,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
