import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitReactionPreview extends StatelessWidget {
  final String imagePath;
  final bool viewed;
  final bool isEmpty;
  final VoidCallback? onTap;

  const UiKitReactionPreview({
    Key? key,
    required this.imagePath,
    this.viewed = false,
    this.onTap,
    this.isEmpty = false,
  }) : super(key: key);

  factory UiKitReactionPreview.empty({VoidCallback? onTap}) => UiKitReactionPreview(
        imagePath: '',
        viewed: false,
        isEmpty: true,
        onTap: onTap,
      );

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
          if (isEmpty)
            Center(
              child: GradientableWidget(
                gradient: GradientFoundation.defaultLinearGradient,
                child: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.plus,
                  color: Colors.white,
                  fit: BoxFit.cover,
                  height: 32.w,
                  width: 32.w,
                ),
              ),
            ),
          if (!isEmpty)
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
                  border: isEmpty
                      ? Border.all(width: 2, color: ColorsFoundation.neutral40)
                      : viewed
                          ? null
                          : GradientFoundation.gradientBorder,
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
