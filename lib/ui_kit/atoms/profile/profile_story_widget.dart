import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

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
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadiusFoundation.all24,
        border: GradientFoundation.gradientBorder,
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusFoundation.all24,
        child: ImageWidget(
          link: imagePath,
          fit: BoxFit.cover,
          // package: 'shuffle_uikit',
        ),
      ),
    );
  }
}
