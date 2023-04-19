import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/ui_kit_border_radius.dart';
import 'package:shuffle_uikit/foundation/ui_kit_gradient_borders.dart';

class ProfileStoryWidget extends StatelessWidget {
  final String imagePath;

  const ProfileStoryWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration:  BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadiusFoundation.all24,
        border: GradientFoundation.borderGradient,
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusFoundation.all24,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          package: 'shuffle_uikit',
        ),
      ),
    );
  }
}
