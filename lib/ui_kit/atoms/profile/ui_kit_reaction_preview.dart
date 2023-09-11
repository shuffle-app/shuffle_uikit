import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitReactionPreview extends StatelessWidget {
  final String imagePath;
  final bool viewed;
  final VoidCallback? onTap;

  const UiKitReactionPreview({
    Key? key,
    required this.imagePath,
    this.viewed = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = 0.27.sw;
    final height = 147.h;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusFoundation.all24,
            child: ImageWidget(
              color: viewed ? ColorsFoundation.darkNeutral900.withOpacity(0.5) : null,
              colorBlendMode: viewed ? BlendMode.lighten : null,
              link: imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadiusFoundation.all24,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: onTap,
              child: Ink(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.all24,
                  border: viewed ? null : GradientFoundation.gradientBorder,
                ),
                child: SizedBox(
                  width: width,
                  height: height,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
